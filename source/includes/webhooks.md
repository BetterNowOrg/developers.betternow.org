# Webhooks

Webhooks are URL endpoints of your choice that receive notifications about
activities for your charity on the BetterNow platform and any branded sites.

When you create a webhook, you can choose if it should receive notifications for
activities relating to all projects for your charity (present and future) or
only one specific project.

All activities for the project(s) configured for the webhook are sent to the
endpoint. You can decide if you want to act on the activity or ignore it.

## Webhooks Setup

You can add a webhook endpoint in the **Integrations** section of your charity
dashboard.

## Activity Types

The following activities will trigger a notification to your endpoint:

### Test activity

| Activity Type | Description |
| --- | --- |
| test | Sent when you create a new webhook or manually request a test notification |

### User activities
| Activity Type | Description |
| --- | --- |
| user_deleted | The user has been deleted in the BetterNow system |

### Fundraiser page activities
| Activity Type | Description |
| --- | --- |
| fundraiser_created_by_system | A fundraising page is created via an integration with a third-party-system |
| fundraiser_created_by_user | A fundraising page is created on the web site |
| fundraiser_edited | A fundraising page is edited |
| fundraiser_joined_team | A fundraiser page is connected with a team |
| fundraiser_left_team | A fundraiser page is disconnected from a team |
| fundraiser_seven_days_until_end_date_reached | There are seven days remaining until the end-date for a fundraiser |
| fundraiser_halfway_to_end_date | The fundraiser has reached the halfway point
between first publication date and end-date |
| fundraiser_end_date_reached | The fundraiser has reached its end-date |
| fundraiser_fifty_percent_goal_reached | The fundraiser has reached 50% of its goal |
| fundraiser_one_hundred_percent_goal_reached | The fundraiser has reached 100% of its goal |

<aside class="warning">
The <code>end_date</code> and <code>goal</code> can be
changed by the fundraiser owner. The end date and goal -related activities will
only be sent once per fundraising page, even if later the fundraiser owner
increases the goal or extends the end date. The only exception to this is the
'fundraiser_seven_days_until_end_date_reached' event which may be sent multiple
times if the end date is changed.
</aside>

### Team activities
| Activity Type | Description |
| --- | --- |
| team_created_by_system | A team page is created via an integration with a third-party system |
| team_created_by_user | A team page is created on the web site |
| team_edited | A team page is edited |

### Donation activities
| Activity Type | Description |
| --- | --- |
| donation_payment_captured | We have received a donation and payment has succeeded |
| donation_payment_refunded | We have refunded a donation payment |

<aside class="notice">
The list of activities will grow as we add more capabilities to the system, so
your endpoint should expect to receive notifications about new activity types.
</aside>

## Notification request body

Notifications are sent to your endpoint via HTTP POST with an `application/json`
body content-type, encoded as UTF-8.

Here is an example notification request body for a `donation_payment_captured` activity:

```json
{
  "id": "xxx",
  "occurred_at": "2001-01-01T01:01:01.0001Z",
  "activity_type": "donation_payment_captured",
  "resources": {
    "donation": {
      "id": "xxx",
      "url": "https://api.betternow.org/donations/xxx"
    },
    "fundraiser": {
      "id": "xxx",
      "url": "https://api.betternow.org/fundraisers/xxx"
    },
    "team": {
      "id": "xxx",
      "url": "https://api.betternow.org/teams/xxx"
    },
    "event": {
      "id": "xxx",
      "url": "https://api.betternow.org/events/xxx"
    },
    "project": {
      "id": "xxx",
      "url": "https://api.betternow.org/projects/xxx"
    }
  }
}
```

A unique `id` for the activity, a timestamp in ISO8601 format (`occurred_at`) and the `activity_type` are sent with all notifications.

In addition, the resources that have been changed by the activity, which varies
depending on the activity type, are included. You can use the
[API](/#api-resources) to request the full representation of these resources and
update your systems.

The example donation above was received by a fundraiser that is participating in
an event and is part of a team, so the Event and Team resources are included.

The webhook notification body is similar for all notification types. The
resources that are included will change depending on the notification type -
e.g. a Fundraiser notification will not include a donation resource, as the
notification relates to the fundraiser as a whole, rather than one specific
donation.

## Requirements for your endpoint

Your endpoint should respond within 30 seconds with an HTTP 200 response.

If we receive any other response code, or we do not receive a response within 30
seconds, the system will retry sending the notification indefinently until we
receive an HTTP 200 response within 30 seconds.

The system retries at exponentially-increasing intervals equal to
(failure_count^4 + 3) seconds. This means that delivery will be retried 4
seconds after the first failure, 19 seconds after the second, 84 seconds after
the third, 259 seconds after the fourth, and so on until it succeeds.

## Responding to a webhook request

Due to the asynchronous and high availability nature of the system, you should
be aware of the following:

1. Notifications may be delivered in a different order than the order the
   activities occurred. Your system should always use the API to request the
   most up-to-date representation of the resource during the processing of a
   notification.
1. Your endpoint may occasionally receive duplicate notifications for the same
   activity (duplicates will have the same `id`). Your processing logic should
   check to see if a notification with the given id has already been processed,
   and if so ignore the notification.

We encourage you to separate the steps of receiving/storing the webhook
notification, from taking action on it.

We recommend storing the raw request body & headers and then enqueuing a job
that processes the notification and updates your system outside of the HTTP
request/response cycle.

## Verifying the integrity of the request

When you add a new webhook endpoint, we will generate a shared secret that we
use to generate a checksum of the request body using [HMAC
SHA256](https://en.wikipedia.org/wiki/Hash-based_message_authentication_code).
We will send this checksum with the request in the `BN-HMAC-SHA256` HTTP header.

We strongly encourage you to verify the integrity and authenticity of the
request by computing your own checksum using the shared secret and comparing it
with the value in the header before processing the request.

To the right is an example of verifying a webhook request using PHP.

```php
<?php

$request_body     = file_get_contents("php://input");
$request_checksum = $_ENV["HTTP_BN_HMAC_SHA256"];
$shared_secret    = $_ENV["BETTERNOW_WEBHOOK_SHARED_SECRET"];

$our_checksum = hash_hmac("sha256", $request_body, $shared_secret);

if (hash_equals($our_checksum, $request_checksum)) {
  // Request is authenticated
} else {
  // Request is NOT authenticated
}

?>
```
