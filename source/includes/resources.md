
# API Resources

Following are a list of the resources available via the API

## Event

An Event is something that takes place at a particular time and/or place. It could be a sporting event like the Copenhagen Marathon 2013, or a holiday like Christmas 2014

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **activity_score** | *integer* | A number that can be used for sorting lists of events. More recently active events should have a higher activity score than events who have raised more money long ago. | `987654321` |
| **choose_project_to_fundraise_for_url** | *uri* | The url on BetterNow for people who want to fundraise in connection with an event | `"https://www.betternow.org/dk/fundraisers/new?event_id=1234567"` |
| **cover_media:image:url** | *uri* | The url for the image. On the BetterNow site, the video takes precedence if both exist. 461x306 pixels | `"https://cnd.example.net/image.jpg"` |
| **cover_media:video:url** | *uri* | The url for the video. Currently only YouTube and Vimeo are supported. Could be blank. | `"https://youtu.be/12345"` |
| **cover_media:video:oembed_html** | *string* | The OEmbed HTML to display the video. Could be blank. | `"<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"` |
| **cover_media:thumb:url** | *uri* | The url for the cover media that should be displayed in e.g. a card view. 120x80 pixels | `"https://cnd.example.net/image.jpg"` |
| **created_at** | *date-time* | when event was created | `"2012-01-01T12:00:00Z"` |
| **description** | *string* | Text describing the Event added by the event organiser. Contains HTML. | `"<p>This is really, <b>REALLY</b> great</p> <br><br>"` |
| **donations:count** | *integer* | The count of all donations made via this Event | `123` |
| **donations:total_donated:cents** | *integer* | Numeric amount in cents | `1234500` |
| **donations:total_donated:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** <code>^([A-Z]{3})$</code> | `"EUR"` |
| **donations:url** | *uri* | The url to retrieve details on all donations made via this Event | `"https://api.betternow.org/events/1234567/donations"` |
| **end_date** | *date-time* | The date when the Event ends. May be blank in the case of a single day event. | `"2012-01-01"` |
| **fundraisers:count** | *integer* | The number of active fundraisers | `12` |
| **fundraisers:url** | *uri* | The url to retrieve all fundraisers | `"https://api.betternow.org/events/1234567/fundraisers"` |
| **html_url** | *uri* | The url to the Event page on BetterNow | `"https://www.betternow.org/dk/events/copenhagen-marathon-2013"` |
| **id** | *string* | unique identifier of event | `1234567` |
| **location:city** | *string* | The name of a city | `"København"` |
| **name** | *string* | the name of the Event | `"Copenhagen Marathon 2013"` |
| **logo_url** | *uri* | The logo for the Event | `"https://cdn.example.net/logo.png"` |
| **updated_at** | *date-time* | when event was updated | `"2012-01-01T12:00:00Z"` |
| **slug** | *string* | The current url path component to identify the event. This can, and does, change.<br/> **pattern:** <code>^([a-z0-9-]{2,})$</code> | `"cph-marathon-2013"` |
| **start_date** | *date-time* | The date when the Event starts | `"2012-01-01"` |
| **url** | *uri* |  | `"https://api.betternow.org/events/1234567"` |

### Event Info

Info for existing event.

`GET /events/{event_id_or_slug}`

```shell
$ curl -n -X GET https://api.betternow.org/events/$EVENT_ID_OR_SLUG

```

```json
{
  "activity_score": 987654321,
  "choose_project_to_fundraise_for_url": "https://www.betternow.org/dk/fundraisers/new?event_id=1234567",
  "cover_media": {
    "image": {
      "url": "https://cnd.example.net/image.jpg"
    },
    "video": {
      "url": "https://youtu.be/12345",
      "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
    },
    "thumb": {
      "url": "https://cnd.example.net/image.jpg"
    }
  },
  "created_at": "2012-01-01T12:00:00Z",
  "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
  "donations": {
    "count": 123,
    "total_donated": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "url": "https://api.betternow.org/events/1234567/donations"
  },
  "end_date": "2012-01-01",
  "fundraisers": {
    "count": 12,
    "url": "https://api.betternow.org/events/1234567/fundraisers"
  },
  "html_url": "https://www.betternow.org/dk/events/copenhagen-marathon-2013",
  "id": 1234567,
  "location": {
    "city": "København"
  },
  "name": "Copenhagen Marathon 2013",
  "logo_url": "https://cdn.example.net/logo.png",
  "updated_at": "2012-01-01T12:00:00Z",
  "slug": "cph-marathon-2013",
  "start_date": "2012-01-01",
  "url": "https://api.betternow.org/events/1234567"
}
```

### Event List

List existing events.

`GET /events`

```shell
$ curl -n -X GET https://api.betternow.org/events

```

```json
[
  {
    "activity_score": 987654321,
    "choose_project_to_fundraise_for_url": "https://www.betternow.org/dk/fundraisers/new?event_id=1234567",
    "cover_media": {
      "image": {
        "url": "https://cnd.example.net/image.jpg"
      },
      "video": {
        "url": "https://youtu.be/12345",
        "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
      },
      "thumb": {
        "url": "https://cnd.example.net/image.jpg"
      }
    },
    "created_at": "2012-01-01T12:00:00Z",
    "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/events/1234567/donations"
    },
    "end_date": "2012-01-01",
    "fundraisers": {
      "count": 12,
      "url": "https://api.betternow.org/events/1234567/fundraisers"
    },
    "html_url": "https://www.betternow.org/dk/events/copenhagen-marathon-2013",
    "id": 1234567,
    "location": {
      "city": "København"
    },
    "name": "Copenhagen Marathon 2013",
    "logo_url": "https://cdn.example.net/logo.png",
    "updated_at": "2012-01-01T12:00:00Z",
    "slug": "cph-marathon-2013",
    "start_date": "2012-01-01",
    "url": "https://api.betternow.org/events/1234567"
  }
]
```

### Event List Projects

List all Projects associated with an Event

`GET /events/{event_id_or_slug}/projects`

```shell
$ curl -n -X GET https://api.betternow.org/events/$EVENT_ID_OR_SLUG/projects

```

```json
[
  {
    "activity_score": 987654321,
    "cover_media": {
      "image": {
        "url": "https://cnd.example.net/image.jpg"
      },
      "video": {
        "url": "https://youtu.be/12345",
        "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
      },
      "thumb": {
        "url": "https://cnd.example.net/image.jpg"
      }
    },
    "created_at": "2012-01-01T12:00:00Z",
    "description": "We need your money for this <b>GREAT</b> project",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/projects/1234567/donations"
    },
    "donate_url": "https://www.betternow.org/dk/fundraisers/helpnow-indsamling21/donations/new",
    "html_url": "https://www.betternow.org/dk/helpnow-projekt",
    "id": 1234567,
    "fundraisers": {
      "count": 12,
      "url": "https://api.betternow.org/projects/1234567/fundraisers"
    },
    "name": "HelpNows generelle arbejde",
    "new_fundraiser_url": "https://www.betternow.org/dk/projects/helpnow-projekt/fundraisers/new",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/projects/1234567",
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow"
    },
    "slug": "helpnow-project"
  }
]
```

### Event List Fundraisers

List all Fundraisers associated with an Event

`GET /events/{event_id_or_slug}/fundraisers`

```shell
$ curl -n -X GET https://api.betternow.org/events/$EVENT_ID_OR_SLUG/fundraisers

```

```json
[
  {
    "activity_score": 987654321,
    "cover_media": {
      "image": {
        "url": "https://cnd.example.net/image.jpg"
      },
      "video": {
        "url": "https://youtu.be/12345",
        "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
      },
      "thumb": {
        "url": "https://cnd.example.net/image.jpg"
      }
    },
    "created_at": "2012-01-01T12:00:00Z",
    "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
    "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/fundraisers/1234567/donations"
    },
    "end_date": "2012-01-01T12:00:00Z",
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "headline": "Firstname Lastname's Fundraiser for HelpNow",
    "html_url": "https://www.betternow.org/dk/firstname-lastnames-fundraiser-for-helpnow",
    "id": 1234567,
    "owner": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "last_name": "Lastname"
    },
    "partner_data": null,
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://www.betternow.org/dk/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://www.betternow.org/dk/events/copenhagen-marathon-2013"
    },
    "slug": "firstname-lastnames-fundraiser-for-helpnow",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/fundraisers/1234567"
  }
]
```

### Event List Teams

List all Teams associated with an Event

`GET /events/{event_id_or_slug}/teams`

```shell
$ curl -n -X GET https://api.betternow.org/events/$EVENT_ID_OR_SLUG/teams

```

```json
[
  {
    "captain": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "last_name": "Lastname"
    },
    "cover_media": {
      "image": {
        "url": "https://cnd.example.net/image.jpg"
      },
      "video": {
        "url": "https://youtu.be/12345",
        "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
      },
      "thumb": {
        "url": "https://cnd.example.net/image.jpg"
      }
    },
    "contact_information": {
      "email": "myteam@example.com",
      "phone": "+4599999999 ex. 1234"
    },
    "created_at": "2012-01-01T12:00:00Z",
    "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/teams/1234567/donations"
    },
    "fundraisers": {
      "count": 12,
      "url": "https://api.betternow.org/teams/1234567/fundraisers"
    },
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "html_url": "https://www.betternow.org/dk/teams/team-novo",
    "id": 1234567,
    "logo_url": "https://cdn.example.net/logo.png",
    "name": "Team NOVO",
    "partner_data": null,
    "slug": "team-novo",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/team/1234567"
  }
]
```

## Fundraising Page

Detailed information about a single Fundraising Page on BetterNow.org

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **activity_score** | *integer* | A number that can be used for sorting lists of fundraisers. More recently active fundraisers should have a higher activity score than fundraisers who have raised more money long ago. | `987654321` |
| **cover_media:image:url** | *uri* | The url for the image. On the BetterNow site, the video takes precedence if both exist. 461x306 pixels | `"https://cnd.example.net/image.jpg"` |
| **cover_media:video:url** | *uri* | The url for the video. Currently only YouTube and Vimeo are supported. Could be blank. | `"https://youtu.be/12345"` |
| **cover_media:video:oembed_html** | *string* | The OEmbed HTML to display the video. Could be blank. | `"<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"` |
| **cover_media:thumb:url** | *uri* | The url for the cover media that should be displayed in e.g. a card view. 120x80 pixels | `"https://cnd.example.net/image.jpg"` |
| **created_at** | *date-time* | when resource was created | `"2012-01-01T12:00:00Z"` |
| **description** | *string* | The text written by the fundraiser owner. Contains HTML. | `"<p>This is really, <b>REALLY</b> great</p> <br><br>"` |
| **donate_url** | *uri* | The current url to donate via the fundraising page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new"` |
| **donations:count** | *integer* | The count of all donations made to this fundraiser | `123` |
| **donations:total_donated:cents** | *integer* | Numeric amount in cents | `1234500` |
| **donations:total_donated:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** <code>^([A-Z]{3})$</code> | `"EUR"` |
| **donations:url** | *uri* | The url to retrieve details on all donations made to this fundraiser | `"https://api.betternow.org/fundraisers/1234567/donations"` |
| **end_date** | *date-time* | The end date for a fundraiser. | `"2012-01-01T12:00:00Z"` |
| **goal:cents** | *integer* | Numeric amount in cents | `1234500` |
| **goal:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** <code>^([A-Z]{3})$</code> | `"EUR"` |
| **headline** | *string* | The headline for this fundraising page | `"Firstname Lastname's Fundraiser for HelpNow"` |
| **html_url** | *uri* | The current url to view the fundraising page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://www.betternow.org/dk/firstname-lastnames-fundraiser-for-helpnow"` |
| **id** | *string* | The unique identifier of the fundraising page | `1234567` |
| **owner:avatar_url** | *uri* | The URL for the avatar image for the user. 92x92 pixels | `"https://cdn.example.net/avatar.jpg"` |
| **owner:first_name** | *string* | The first name of the user | `"Firstname"` |
| **owner:last_name** | *string* | The last name of the user | `"Lastname"` |
| **partner_data** | *object* | An object contaning data from partner systems. Structure varies depending on the partner. |  |
| **recipient:id** | *string* | Unique identifier of organisation | `1234567` |
| **recipient:name** | *string* | The name of the Organisation | `"HelpNow"` |
| **recipient:url** | *uri* |  | `"https://api.betternow.org/organisations/1234567"` |
| **recipient:html_url** | *uri* | The current url to view the organisation page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://www.betternow.org/dk/helpnow"` |
| **team:id** | *string* | unique identifier of team | `1234567` |
| **team:name** | *string* | the name of the Team | `"Team NOVO"` |
| **team:url** | *uri* |  | `"https://api.betternow.org/team/1234567"` |
| **team:html_url** | *uri* | The url to the Team page on BetterNow | `"https://www.betternow.org/dk/teams/team-novo"` |
| **project:id** | *string* | Unique identifier of project | `1234567` |
| **project:name** | *string* | The name of the Project | `"HelpNows generelle arbejde"` |
| **project:url** | *uri* |  | `"https://api.betternow.org/projects/1234567"` |
| **project:html_url** | *uri* | The current url to view the project page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://www.betternow.org/dk/helpnow-projekt"` |
| **event:id** | *string* | unique identifier of event | `1234567` |
| **event:name** | *string* | the name of the Event | `"Copenhagen Marathon 2013"` |
| **event:url** | *uri* |  | `"https://api.betternow.org/events/1234567"` |
| **event:html_url** | *uri* | The url to the Event page on BetterNow | `"https://www.betternow.org/dk/events/copenhagen-marathon-2013"` |
| **slug** | *string* | The current url path component to identify the fundraiser. This can, and does, change.<br/> **pattern:** <code>^([a-z0-9-]{2,})$</code> | `"firstname-lastnames-fundraiser-for-helpnow"` |
| **updated_at** | *date-time* | when resource was updated | `"2012-01-01T12:00:00Z"` |
| **url** | *uri* |  | `"https://api.betternow.org/fundraisers/1234567"` |

### Fundraising Page Info

Info for existing fundraiser.

`GET /fundraisers/{fundraiser_id_or_slug}`

```shell
$ curl -n -X GET https://api.betternow.org/fundraisers/$FUNDRAISER_ID_OR_SLUG

```

```json
{
  "activity_score": 987654321,
  "cover_media": {
    "image": {
      "url": "https://cnd.example.net/image.jpg"
    },
    "video": {
      "url": "https://youtu.be/12345",
      "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
    },
    "thumb": {
      "url": "https://cnd.example.net/image.jpg"
    }
  },
  "created_at": "2012-01-01T12:00:00Z",
  "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
  "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
  "donations": {
    "count": 123,
    "total_donated": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "url": "https://api.betternow.org/fundraisers/1234567/donations"
  },
  "end_date": "2012-01-01T12:00:00Z",
  "goal": {
    "cents": 1234500,
    "currency": "EUR"
  },
  "headline": "Firstname Lastname's Fundraiser for HelpNow",
  "html_url": "https://www.betternow.org/dk/firstname-lastnames-fundraiser-for-helpnow",
  "id": 1234567,
  "owner": {
    "avatar_url": "https://cdn.example.net/avatar.jpg",
    "first_name": "Firstname",
    "last_name": "Lastname"
  },
  "partner_data": null,
  "recipient": {
    "id": 1234567,
    "name": "HelpNow",
    "url": "https://api.betternow.org/organisations/1234567",
    "html_url": "https://www.betternow.org/dk/helpnow"
  },
  "team": {
    "id": 1234567,
    "name": "Team NOVO",
    "url": "https://api.betternow.org/team/1234567",
    "html_url": "https://www.betternow.org/dk/teams/team-novo"
  },
  "project": {
    "id": 1234567,
    "name": "HelpNows generelle arbejde",
    "url": "https://api.betternow.org/projects/1234567",
    "html_url": "https://www.betternow.org/dk/helpnow-projekt"
  },
  "event": {
    "id": 1234567,
    "name": "Copenhagen Marathon 2013",
    "url": "https://api.betternow.org/events/1234567",
    "html_url": "https://www.betternow.org/dk/events/copenhagen-marathon-2013"
  },
  "slug": "firstname-lastnames-fundraiser-for-helpnow",
  "updated_at": "2012-01-01T12:00:00Z",
  "url": "https://api.betternow.org/fundraisers/1234567"
}
```

### Fundraising Page List

List existing fundraisers.

`GET /fundraisers`

```shell
$ curl -n -X GET https://api.betternow.org/fundraisers

```

```json
[
  {
    "activity_score": 987654321,
    "cover_media": {
      "image": {
        "url": "https://cnd.example.net/image.jpg"
      },
      "video": {
        "url": "https://youtu.be/12345",
        "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
      },
      "thumb": {
        "url": "https://cnd.example.net/image.jpg"
      }
    },
    "created_at": "2012-01-01T12:00:00Z",
    "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
    "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/fundraisers/1234567/donations"
    },
    "end_date": "2012-01-01T12:00:00Z",
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "headline": "Firstname Lastname's Fundraiser for HelpNow",
    "html_url": "https://www.betternow.org/dk/firstname-lastnames-fundraiser-for-helpnow",
    "id": 1234567,
    "owner": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "last_name": "Lastname"
    },
    "partner_data": null,
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://www.betternow.org/dk/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://www.betternow.org/dk/events/copenhagen-marathon-2013"
    },
    "slug": "firstname-lastnames-fundraiser-for-helpnow",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/fundraisers/1234567"
  }
]
```

### Fundraising Page List Donations

List the donations for existing fundraiser. Donations will always be returned in reverse-chronological order (newest first).

`GET /fundraisers/{fundraiser_id_or_slug}/donations`

```shell
$ curl -n -X GET https://api.betternow.org/fundraisers/$FUNDRAISER_ID_OR_SLUG/donations

```

```json
[
  {
    "amount": {
      "cents": 12345,
      "currency": "EUR"
    },
    "comment": "Wow, what a great idea!",
    "created_at": "2012-01-01T12:00:00Z",
    "id": 1234567,
    "name": "Joes Truck Stop",
    "updated_at": "2012-01-01T12:00:00Z"
  }
]
```

### Fundraising Page List Fundraiser Updates

List the updates for existing fundraiser.

`GET /fundraisers/{fundraiser_id_or_slug}/updates`

```shell
$ curl -n -X GET https://api.betternow.org/fundraisers/$FUNDRAISER_ID_OR_SLUG/updates

```

```json
[
  {
    "body": "<p>Thanks for all your support - you <strong>rock!</strong>",
    "cover_media": {
      "image": {
        "url": "https://cnd.example.net/image.jpg"
      },
      "video": {
        "url": "https://youtu.be/12345",
        "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
      },
      "thumb": {
        "url": "https://cnd.example.net/image.jpg"
      }
    },
    "created_at": "2012-01-01T12:00:00Z",
    "owner": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "last_name": "Lastname"
    },
    "title": "Great job everyone!",
    "updated_at": "2012-01-01T12:00:00Z"
  }
]
```

## Organisation

An Organisation can receive Donations on BetterNow

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cover_media:image:url** | *uri* | The url for the image. On the BetterNow site, the video takes precedence if both exist. 461x306 pixels | `"https://cnd.example.net/image.jpg"` |
| **cover_media:video:url** | *uri* | The url for the video. Currently only YouTube and Vimeo are supported. Could be blank. | `"https://youtu.be/12345"` |
| **cover_media:video:oembed_html** | *string* | The OEmbed HTML to display the video. Could be blank. | `"<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"` |
| **cover_media:thumb:url** | *uri* | The url for the cover media that should be displayed in e.g. a card view. 120x80 pixels | `"https://cnd.example.net/image.jpg"` |
| **created_at** | *date-time* | When organisation was created | `"2012-01-01T12:00:00Z"` |
| **description** | *string* | The text written by the Organisation's administrators. Contains HTML | `"HelpNow is a dummy organisation created by BetterNow - to help us doing tutorial videos and screenshots. It is not a real organisation, and you cannot donate here.<br><br><br>"` |
| **donations:count** | *integer* | The count of all donations made to this project | `123` |
| **donations:total_donated:cents** | *integer* | Numeric amount in cents | `1234500` |
| **donations:total_donated:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** <code>^([A-Z]{3})$</code> | `"EUR"` |
| **donations:url** | *uri* | The url to retrieve details on all donations made to this organisation | `"https://api.betternow.org/organisations/1234567/donations"` |
| **donate_url** | *uri* | The current url to donate directly to the organisation on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://www.betternow.org/dk/fundraisers/helpnow-indsamling1/donations/new"` |
| **fundraisers:count** | *integer* | The number of active fundraisers | `12` |
| **fundraisers:url** | *uri* | The url to retrieve all fundraisers | `"https://api.betternow.org/organisations/1234567/fundraisers"` |
| **html_url** | *uri* | The current url to view the organisation page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://www.betternow.org/dk/helpnow"` |
| **id** | *string* | Unique identifier of organisation | `1234567` |
| **logo_url** | *uri* | The logo for the Organisation. 92x92 pixels. | `"https://cdn.example.net/logo.png"` |
| **name** | *string* | The name of the Organisation | `"HelpNow"` |
| **new_fundraiser_url** | *uri* | The current url to create a new Fundraiser for this organisation on BetterNow. This can, and does, change. Requests to old urls will redirect to the current url. | `"https://www.betternow.org/dk/projects/helpnow-projekt/fundraisers/new"` |
| **projects:count** | *integer* | The count of the organisation's active projects | `12` |
| **projects:url** | *uri* | The url to retrieve details about this organisation's projects | `"https://api.betternow.org/organisations/1234567/projects"` |
| **updated_at** | *date-time* | When organisation was updated | `"2012-01-01T12:00:00Z"` |
| **url** | *uri* |  | `"https://api.betternow.org/organisations/1234567"` |

### Organisation Info

Info for existing organisation.

`GET /organisations/{organisation_id_or_slug}`

```shell
$ curl -n -X GET https://api.betternow.org/organisations/$ORGANISATION_ID_OR_SLUG

```

```json
{
  "cover_media": {
    "image": {
      "url": "https://cnd.example.net/image.jpg"
    },
    "video": {
      "url": "https://youtu.be/12345",
      "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
    },
    "thumb": {
      "url": "https://cnd.example.net/image.jpg"
    }
  },
  "created_at": "2012-01-01T12:00:00Z",
  "description": "HelpNow is a dummy organisation created by BetterNow - to help us doing tutorial videos and screenshots. It is not a real organisation, and you cannot donate here.<br><br><br>",
  "donations": {
    "count": 123,
    "total_donated": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "url": "https://api.betternow.org/organisations/1234567/donations"
  },
  "donate_url": "https://www.betternow.org/dk/fundraisers/helpnow-indsamling1/donations/new",
  "fundraisers": {
    "count": 12,
    "url": "https://api.betternow.org/organisations/1234567/fundraisers"
  },
  "html_url": "https://www.betternow.org/dk/helpnow",
  "id": 1234567,
  "logo_url": "https://cdn.example.net/logo.png",
  "name": "HelpNow",
  "new_fundraiser_url": "https://www.betternow.org/dk/projects/helpnow-projekt/fundraisers/new",
  "projects": {
    "count": 12,
    "url": "https://api.betternow.org/organisations/1234567/projects"
  },
  "updated_at": "2012-01-01T12:00:00Z",
  "url": "https://api.betternow.org/organisations/1234567"
}
```

### Organisation List Projects

List all Projects for an existing Organisation. Projects will be ordered by activity score, descending.

`GET /organisations/{organisation_id_or_slug}/projects`

```shell
$ curl -n -X GET https://api.betternow.org/organisations/$ORGANISATION_ID_OR_SLUG/projects

```

```json
[
  {
    "activity_score": 987654321,
    "cover_media": {
      "image": {
        "url": "https://cnd.example.net/image.jpg"
      },
      "video": {
        "url": "https://youtu.be/12345",
        "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
      },
      "thumb": {
        "url": "https://cnd.example.net/image.jpg"
      }
    },
    "created_at": "2012-01-01T12:00:00Z",
    "description": "We need your money for this <b>GREAT</b> project",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/projects/1234567/donations"
    },
    "donate_url": "https://www.betternow.org/dk/fundraisers/helpnow-indsamling21/donations/new",
    "html_url": "https://www.betternow.org/dk/helpnow-projekt",
    "id": 1234567,
    "fundraisers": {
      "count": 12,
      "url": "https://api.betternow.org/projects/1234567/fundraisers"
    },
    "name": "HelpNows generelle arbejde",
    "new_fundraiser_url": "https://www.betternow.org/dk/projects/helpnow-projekt/fundraisers/new",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/projects/1234567",
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow"
    },
    "slug": "helpnow-project"
  }
]
```

### Organisation List Fundraisers

List all Fundraisers for an existing Organisation. Fundraisers will be ordered by activity score, descending.

`GET /organisations/{organisation_id_or_slug}/fundraisers`

```shell
$ curl -n -X GET https://api.betternow.org/organisations/$ORGANISATION_ID_OR_SLUG/fundraisers

```

```json
[
  {
    "activity_score": 987654321,
    "cover_media": {
      "image": {
        "url": "https://cnd.example.net/image.jpg"
      },
      "video": {
        "url": "https://youtu.be/12345",
        "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
      },
      "thumb": {
        "url": "https://cnd.example.net/image.jpg"
      }
    },
    "created_at": "2012-01-01T12:00:00Z",
    "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
    "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/fundraisers/1234567/donations"
    },
    "end_date": "2012-01-01T12:00:00Z",
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "headline": "Firstname Lastname's Fundraiser for HelpNow",
    "html_url": "https://www.betternow.org/dk/firstname-lastnames-fundraiser-for-helpnow",
    "id": 1234567,
    "owner": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "last_name": "Lastname"
    },
    "partner_data": null,
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://www.betternow.org/dk/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://www.betternow.org/dk/events/copenhagen-marathon-2013"
    },
    "slug": "firstname-lastnames-fundraiser-for-helpnow",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/fundraisers/1234567"
  }
]
```

### Organisation List Donations

List the donations for an existing Organisation. Donations will always be returned in reverse-chronological order (newest first).

`GET /organisations/{organisation_id_or_slug}/donations`

```shell
$ curl -n -X GET https://api.betternow.org/organisations/$ORGANISATION_ID_OR_SLUG/donations

```

```json
[
  {
    "amount": {
      "cents": 12345,
      "currency": "EUR"
    },
    "comment": "Wow, what a great idea!",
    "created_at": "2012-01-01T12:00:00Z",
    "id": 1234567,
    "name": "Joes Truck Stop",
    "updated_at": "2012-01-01T12:00:00Z"
  }
]
```

## Project

A Project is a specific cause that Users can Fundraise for. An Organisation typically has several Projects

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **activity_score** | *integer* | A number that can be used for sorting lists of projects. More recently active projects should have a higher activity score than projects who have raised more money long ago. | `987654321` |
| **cover_media:image:url** | *uri* | The url for the image. On the BetterNow site, the video takes precedence if both exist. 461x306 pixels | `"https://cnd.example.net/image.jpg"` |
| **cover_media:video:url** | *uri* | The url for the video. Currently only YouTube and Vimeo are supported. Could be blank. | `"https://youtu.be/12345"` |
| **cover_media:video:oembed_html** | *string* | The OEmbed HTML to display the video. Could be blank. | `"<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"` |
| **cover_media:thumb:url** | *uri* | The url for the cover media that should be displayed in e.g. a card view. 120x80 pixels | `"https://cnd.example.net/image.jpg"` |
| **created_at** | *date-time* | When project was created | `"2012-01-01T12:00:00Z"` |
| **description** | *string* | The text written by the Project's administrators. Contains HTML | `"We need your money for this <b>GREAT</b> project"` |
| **donations:count** | *integer* | The count of all donations made to this project | `123` |
| **donations:total_donated:cents** | *integer* | Numeric amount in cents | `1234500` |
| **donations:total_donated:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** <code>^([A-Z]{3})$</code> | `"EUR"` |
| **donations:url** | *uri* | The url to retrieve details on all donations made to this project | `"https://api.betternow.org/projects/1234567/donations"` |
| **donate_url** | *uri* | The current url to donate directly to the project on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://www.betternow.org/dk/fundraisers/helpnow-indsamling21/donations/new"` |
| **html_url** | *uri* | The current url to view the project page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://www.betternow.org/dk/helpnow-projekt"` |
| **id** | *string* | Unique identifier of project | `1234567` |
| **fundraisers:count** | *integer* | The number of active fundraisers | `12` |
| **fundraisers:url** | *uri* | The url to retrieve all fundraisers | `"https://api.betternow.org/projects/1234567/fundraisers"` |
| **name** | *string* | The name of the Project | `"HelpNows generelle arbejde"` |
| **new_fundraiser_url** | *uri* | The current url to create a new Fundraiser for this project on BetterNow. This can, and does, change. Requests to old urls will redirect to the current url. | `"https://www.betternow.org/dk/projects/helpnow-projekt/fundraisers/new"` |
| **updated_at** | *date-time* | When project was updated | `"2012-01-01T12:00:00Z"` |
| **url** | *uri* |  | `"https://api.betternow.org/projects/1234567"` |
| **recipient:id** | *string* | Unique identifier of organisation | `1234567` |
| **recipient:name** | *string* | The name of the Organisation | `"HelpNow"` |
| **recipient:url** | *uri* |  | `"https://api.betternow.org/organisations/1234567"` |
| **recipient:html_url** | *uri* | The current url to view the organisation page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://www.betternow.org/dk/helpnow"` |
| **slug** | *string* | The current url path component to identify the project. This can, and does, change.<br/> **pattern:** <code>^([a-z0-9-]{2,})$</code> | `"helpnow-project"` |

### Project Info

Info for existing project.

`GET /projects/{project_id_or_slug}`

```shell
$ curl -n -X GET https://api.betternow.org/projects/$PROJECT_ID_OR_SLUG

```

```json
{
  "activity_score": 987654321,
  "cover_media": {
    "image": {
      "url": "https://cnd.example.net/image.jpg"
    },
    "video": {
      "url": "https://youtu.be/12345",
      "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
    },
    "thumb": {
      "url": "https://cnd.example.net/image.jpg"
    }
  },
  "created_at": "2012-01-01T12:00:00Z",
  "description": "We need your money for this <b>GREAT</b> project",
  "donations": {
    "count": 123,
    "total_donated": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "url": "https://api.betternow.org/projects/1234567/donations"
  },
  "donate_url": "https://www.betternow.org/dk/fundraisers/helpnow-indsamling21/donations/new",
  "html_url": "https://www.betternow.org/dk/helpnow-projekt",
  "id": 1234567,
  "fundraisers": {
    "count": 12,
    "url": "https://api.betternow.org/projects/1234567/fundraisers"
  },
  "name": "HelpNows generelle arbejde",
  "new_fundraiser_url": "https://www.betternow.org/dk/projects/helpnow-projekt/fundraisers/new",
  "updated_at": "2012-01-01T12:00:00Z",
  "url": "https://api.betternow.org/projects/1234567",
  "recipient": {
    "id": 1234567,
    "name": "HelpNow",
    "url": "https://api.betternow.org/organisations/1234567",
    "html_url": "https://www.betternow.org/dk/helpnow"
  },
  "slug": "helpnow-project"
}
```

### Project List Fundraisers

List all Fundraisers for an existing Project. Fundraisers will be ordered by activity score, descending.

`GET /projects/{project_id_or_slug}/fundraisers`

```shell
$ curl -n -X GET https://api.betternow.org/projects/$PROJECT_ID_OR_SLUG/fundraisers

```

```json
[
  {
    "activity_score": 987654321,
    "cover_media": {
      "image": {
        "url": "https://cnd.example.net/image.jpg"
      },
      "video": {
        "url": "https://youtu.be/12345",
        "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
      },
      "thumb": {
        "url": "https://cnd.example.net/image.jpg"
      }
    },
    "created_at": "2012-01-01T12:00:00Z",
    "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
    "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/fundraisers/1234567/donations"
    },
    "end_date": "2012-01-01T12:00:00Z",
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "headline": "Firstname Lastname's Fundraiser for HelpNow",
    "html_url": "https://www.betternow.org/dk/firstname-lastnames-fundraiser-for-helpnow",
    "id": 1234567,
    "owner": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "last_name": "Lastname"
    },
    "partner_data": null,
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://www.betternow.org/dk/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://www.betternow.org/dk/events/copenhagen-marathon-2013"
    },
    "slug": "firstname-lastnames-fundraiser-for-helpnow",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/fundraisers/1234567"
  }
]
```

### Project List Donations

List the donations for existing project. Donations will always be returned in reverse-chronological order (newest first).

`GET /projects/{project_id_or_slug}/donations`

```shell
$ curl -n -X GET https://api.betternow.org/projects/$PROJECT_ID_OR_SLUG/donations

```

```json
[
  {
    "amount": {
      "cents": 12345,
      "currency": "EUR"
    },
    "comment": "Wow, what a great idea!",
    "created_at": "2012-01-01T12:00:00Z",
    "id": 1234567,
    "name": "Joes Truck Stop",
    "updated_at": "2012-01-01T12:00:00Z"
  }
]
```

## Team

A Team is a collection of Fundraisers, who may or may not be raising money in connection with a single Event.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **captain:avatar_url** | *uri* | The URL for the avatar image for the user. 92x92 pixels | `"https://cdn.example.net/avatar.jpg"` |
| **captain:first_name** | *string* | The first name of the user | `"Firstname"` |
| **captain:last_name** | *string* | The last name of the user | `"Lastname"` |
| **cover_media:image:url** | *uri* | The url for the image. On the BetterNow site, the video takes precedence if both exist. 461x306 pixels | `"https://cnd.example.net/image.jpg"` |
| **cover_media:video:url** | *uri* | The url for the video. Currently only YouTube and Vimeo are supported. Could be blank. | `"https://youtu.be/12345"` |
| **cover_media:video:oembed_html** | *string* | The OEmbed HTML to display the video. Could be blank. | `"<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"` |
| **cover_media:thumb:url** | *uri* | The url for the cover media that should be displayed in e.g. a card view. 120x80 pixels | `"https://cnd.example.net/image.jpg"` |
| **contact_information:email** | *string* | the public contact email for the team | `"myteam@example.com"` |
| **contact_information:phone** | *string* | the public contact phone for the team | `"+4599999999 ex. 1234"` |
| **created_at** | *date-time* | when team was created | `"2012-01-01T12:00:00Z"` |
| **description** | *string* | Text describing the Team added by the Team Captain. Contains HTML. | `"<p>This is really, <b>REALLY</b> great</p> <br><br>"` |
| **donations:count** | *integer* | The count of all donations made | `123` |
| **donations:total_donated:cents** | *integer* | Numeric amount in cents | `1234500` |
| **donations:total_donated:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** <code>^([A-Z]{3})$</code> | `"EUR"` |
| **donations:url** | *uri* | The url to retrieve details on all donations made via team members | `"https://api.betternow.org/teams/1234567/donations"` |
| **fundraisers:count** | *integer* | The number of active fundraisers | `12` |
| **fundraisers:url** | *uri* | The url to retrieve all fundraisers | `"https://api.betternow.org/teams/1234567/fundraisers"` |
| **goal:cents** | *integer* | Numeric amount in cents | `1234500` |
| **goal:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** <code>^([A-Z]{3})$</code> | `"EUR"` |
| **html_url** | *uri* | The url to the Team page on BetterNow | `"https://www.betternow.org/dk/teams/team-novo"` |
| **id** | *string* | unique identifier of team | `1234567` |
| **logo_url** | *uri* | The logo for the team. 92x92 pixels. | `"https://cdn.example.net/logo.png"` |
| **name** | *string* | the name of the Team | `"Team NOVO"` |
| **partner_data** | *object* | An object contaning data from partner systems. Structure varies depending on the partner. |  |
| **slug** | *string* | The current url path component to identify the team. This can, and does, change.<br/> **pattern:** <code>^([a-z0-9-]{2,})$</code> | `"team-novo"` |
| **updated_at** | *date-time* | when team was updated | `"2012-01-01T12:00:00Z"` |
| **url** | *uri* |  | `"https://api.betternow.org/team/1234567"` |

### Team Info

Info for existing team.

`GET /teams/{team_id_or_slug}`

```shell
$ curl -n -X GET https://api.betternow.org/teams/$TEAM_ID_OR_SLUG

```

```json
{
  "captain": {
    "avatar_url": "https://cdn.example.net/avatar.jpg",
    "first_name": "Firstname",
    "last_name": "Lastname"
  },
  "cover_media": {
    "image": {
      "url": "https://cnd.example.net/image.jpg"
    },
    "video": {
      "url": "https://youtu.be/12345",
      "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
    },
    "thumb": {
      "url": "https://cnd.example.net/image.jpg"
    }
  },
  "contact_information": {
    "email": "myteam@example.com",
    "phone": "+4599999999 ex. 1234"
  },
  "created_at": "2012-01-01T12:00:00Z",
  "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
  "donations": {
    "count": 123,
    "total_donated": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "url": "https://api.betternow.org/teams/1234567/donations"
  },
  "fundraisers": {
    "count": 12,
    "url": "https://api.betternow.org/teams/1234567/fundraisers"
  },
  "goal": {
    "cents": 1234500,
    "currency": "EUR"
  },
  "html_url": "https://www.betternow.org/dk/teams/team-novo",
  "id": 1234567,
  "logo_url": "https://cdn.example.net/logo.png",
  "name": "Team NOVO",
  "partner_data": null,
  "slug": "team-novo",
  "updated_at": "2012-01-01T12:00:00Z",
  "url": "https://api.betternow.org/team/1234567"
}
```

### Team List

List existing teams.

`GET /teams`

```shell
$ curl -n -X GET https://api.betternow.org/teams

```

```json
[
  {
    "captain": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "last_name": "Lastname"
    },
    "cover_media": {
      "image": {
        "url": "https://cnd.example.net/image.jpg"
      },
      "video": {
        "url": "https://youtu.be/12345",
        "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
      },
      "thumb": {
        "url": "https://cnd.example.net/image.jpg"
      }
    },
    "contact_information": {
      "email": "myteam@example.com",
      "phone": "+4599999999 ex. 1234"
    },
    "created_at": "2012-01-01T12:00:00Z",
    "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/teams/1234567/donations"
    },
    "fundraisers": {
      "count": 12,
      "url": "https://api.betternow.org/teams/1234567/fundraisers"
    },
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "html_url": "https://www.betternow.org/dk/teams/team-novo",
    "id": 1234567,
    "logo_url": "https://cdn.example.net/logo.png",
    "name": "Team NOVO",
    "partner_data": null,
    "slug": "team-novo",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/team/1234567"
  }
]
```

### Team List Fundraisers

List all Fundraisers that are members of this Team. Fundraisers will be ordered by the amount of money donated, descending

`GET /teams/{team_id_or_slug}/fundraisers`

```shell
$ curl -n -X GET https://api.betternow.org/teams/$TEAM_ID_OR_SLUG/fundraisers

```

```json
[
  {
    "activity_score": 987654321,
    "cover_media": {
      "image": {
        "url": "https://cnd.example.net/image.jpg"
      },
      "video": {
        "url": "https://youtu.be/12345",
        "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
      },
      "thumb": {
        "url": "https://cnd.example.net/image.jpg"
      }
    },
    "created_at": "2012-01-01T12:00:00Z",
    "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
    "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/fundraisers/1234567/donations"
    },
    "end_date": "2012-01-01T12:00:00Z",
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "headline": "Firstname Lastname's Fundraiser for HelpNow",
    "html_url": "https://www.betternow.org/dk/firstname-lastnames-fundraiser-for-helpnow",
    "id": 1234567,
    "owner": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "last_name": "Lastname"
    },
    "partner_data": null,
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://www.betternow.org/dk/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://www.betternow.org/dk/events/copenhagen-marathon-2013"
    },
    "slug": "firstname-lastnames-fundraiser-for-helpnow",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/fundraisers/1234567"
  }
]
```

### Team List Donations

List all donations given via this Team

`GET /teams/{team_id_or_slug}/donations`

```shell
$ curl -n -X GET https://api.betternow.org/teams/$TEAM_ID_OR_SLUG/donations

```

```json
[
  {
    "amount": {
      "cents": 12345,
      "currency": "EUR"
    },
    "comment": "Wow, what a great idea!",
    "created_at": "2012-01-01T12:00:00Z",
    "id": 1234567,
    "name": "Joes Truck Stop",
    "updated_at": "2012-01-01T12:00:00Z"
  }
]
```

### Team List Projects

List all Projects that team members are fundraising for

`GET /teams/{team_id_or_slug}/projects`

```shell
$ curl -n -X GET https://api.betternow.org/teams/$TEAM_ID_OR_SLUG/projects

```

```json
[
  {
    "activity_score": 987654321,
    "cover_media": {
      "image": {
        "url": "https://cnd.example.net/image.jpg"
      },
      "video": {
        "url": "https://youtu.be/12345",
        "oembed_html": "<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"
      },
      "thumb": {
        "url": "https://cnd.example.net/image.jpg"
      }
    },
    "created_at": "2012-01-01T12:00:00Z",
    "description": "We need your money for this <b>GREAT</b> project",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/projects/1234567/donations"
    },
    "donate_url": "https://www.betternow.org/dk/fundraisers/helpnow-indsamling21/donations/new",
    "html_url": "https://www.betternow.org/dk/helpnow-projekt",
    "id": 1234567,
    "fundraisers": {
      "count": 12,
      "url": "https://api.betternow.org/projects/1234567/fundraisers"
    },
    "name": "HelpNows generelle arbejde",
    "new_fundraiser_url": "https://www.betternow.org/dk/projects/helpnow-projekt/fundraisers/new",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/projects/1234567",
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://www.betternow.org/dk/helpnow"
    },
    "slug": "helpnow-project"
  }
]
```
