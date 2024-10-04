
# API Endpoints/Resources

Following is a list of the endpoints/resources that are available via the api,
the operations that are supported for each resource, and examples of response
data.

The `curl` examples use the `-n` flag to authenticate using the `.netrc` file.
For more information about configuring your `.netrc` see the [curl example
above](/#curl-example).

## Donation versus Donation Detail

The api provides both a `/donations/uuid` and a `/donation-details/uuid`
endpoint.

The first is accessible with a publishable api key and can be used in
client-side/javascript applications. It provides the publicly available
information about a donation.

The second requries a secret key and is meant for server-side CRM and ERP
integrations. It includes much more data, including private data such as the
donor's tax id, etc.

The webhook notification for donation-related activities includes both a `url`
and a `private_details_url` which can be used to get more information about the
donation.
