---
title: API Reference

language_tabs:
  - shell

toc_footers:
  - <a href="https://intl.betternow.org/developer-agreement" target="_blank">Developer Agreement</a>
  - <a href="https://intl.betternow.org/terms" target="_blank">Terms
    &amp; Conditions</a>
  - <a href="https://intl.betternow.org/developer-agreement" target="_blank">Security</a>
  - <a href="http://status.betternow.org" target="_blank">System Status</a>
  - <a href="https://help.betternow.org/hc/en-us/categories/200126293-For-Charities" target="_blank">BetterNow Charity Support</a>
  - <a href="mailto:apisupport@betternow.org">apisupport@betternow.org</a>
  - <a href="https://www.betternow.org">&copy; BetterNow Worldwide Aps</a>

includes:
  - resources
  - webhooks

search: true
---

# Welcome!

The BetterNow API provides the building blocks that allow charities and event
organizers to integrate their fundraising and donation activities on the
BetterNow platform and Branded Sites with other information systems.

Here are a few of the real-world integrations that use the API today:

* Participants in a charity sports event automatically get a fundraiser created for
  them when registering for the event, via an integration with the event's ticketing system.
* A charity's CRM system is automatically updated in real-time as donations
  and fundraisers are created on their BetterNow sites, via [webhooks](#webhooks) that push
  activity on the BetterNow sites to the charity's system.
* A charity's home page displays the top fundraiser for a specific project, with
  donation amounts that are updated in real-time, and direct links to donate to
  the fundraiser or create another fundraiser for the same cause.

We ♥︎ helping our customers build new integrations. Contact us at <a
href="mailto:apisupport@betternow.org">apisupport@betternow.org</a> if you have
any questions.

<aside class="success">
Note that use of the API is governed by the <a
href="https://intl.betternow.org/developer-agreement" target="_blank">Developer
Agreement</a> and the general <a href="https://intl.betternow.org/terms"
target="_blank">Terms &amp; Conditions</a>
</aside>

## Setup

In the **Integrations** section of your charity dashboard, you can create API
keys that will grant you access to the API.

<img src="/images/add-api-user.png">

When you create an API user, you can decide if the keys should be limited to
activity for only one Project, or for all present and future Projects for your
charity.

In addition, you can add an email address and a short description for each set
of keys.

## Authentication

When you create an API user in your charity dashboard, we generate a
`publishable` key and a `secret` key.

The publishable key can be used in client-side integrations, as shown in the
[HTML example](/#html-javascript-browser-example) below. The publishable key
grants read-only access to the same publicly available information that is
displayed on the BetterNow or Branded site.

The secret key grants write access to some resources and read access to private information.

<aside class="warning">
The <code>secret</code> key should <em>never</em> be exposed in client-side code, commited to source
control, or saved/sent via an insecure channel.
</aside>

The secret key has all of the access rights of a publishable key, so if your
integration is server-side only, you can use the secret key only.

Both keys can be used as the password via HTTP Basic-Auth, or in the browser as shown in our
[HTML example](/#html-javascript-browser-example). When using HTTP Basic-Auth,
send your email address as the username. We will use the email address to contact you if
we notice problems with your API client.

API keys grant access to specific resources such as
[Organisations/Charities](/#organisation), [Events](/#event), etc. and all of
their associated "sub-resources", such as [Fundraising
Pages](/#fundraising-page) and [Teams](/#team).

Authenticated requests for other resources will return a `403 Forbidden`
response.

## Caching

All responses include an `ETag` (or Entity Tag) header, identifying the specific
version of a returned resource.

Use this value to check for changes to a resource by repeating the request and
passing the `ETag` value in the `If-None-Match` header.

If the resource has not changed, a `304 Not Modified` status will be returned
with an empty body. If the resource has changed, the request will proceed
normally.

Web browser api clients should do this automatically via [HTTP Conditional
Get](https://tools.ietf.org/html/rfc7232)

## Clients

Clients **must** address requests to `api.betternow.org` using HTTPS and specify the
`Accept: application/vnd.betternow+json; version=1` Accept header.

Non-browser clients **should** specify a User-Agent header to facilitate tracking and debugging.

## CORS

The API fully supports cross-origin resource sharing (CORS) to enable
browser-based clients.

## Rate Limits

We continually monitor the health of our API and reserve the right to enforce
rate limits.

Rate-limited requests will receive a response with a `429 Too Many Requests` status.

We encourage you to add something like [exponential
back-off](https://en.wikipedia.org/wiki/Exponential_backoff) to your API client,
periodically retrying your requests if you receive a `429` status code.

## Pagination via Ranges

List requests will return a `Content-Range` header indicating the range of values
returned. Large lists may require additional requests to retrieve. If a list
response has been truncated you will receive a `206 Partial Content` status and
the `Next-Range` header will be set. 50 resources will be sent at a time.

To retrieve the next range, repeat the request with the `Range` header set to
the value of the previous request’s `Next-Range` header and the `Range-Unit:
items` header, e.g:

### Initial request to paginated resource

```shell
curl -n -sS -i -H 'Accept: application/vnd.betternow+json; version=1' \
  https://api.betternow.org/fundraisers

HTTP/1.1 206 Partial Content
#... ommitted headers
Accept-Ranges: items
Content-Range: 0-49/7167
Link: <https://api.betternow.org/fundraisers>; rel="next"; items="50-7216", <https://api.betternow.org/fundraisers>; rel="last"; items="7150-14316"
Next-Range: 50-7216
Range-Unit: items
Status: 206 Partial Content
```

### Subsequent request to paginated resource

```shell
curl -n -sS -i -H 'Accept: application/vnd.betternow+json; version=1' \
  -H 'Range-Unit: items' \
  -H 'Range: 50-7216' \
  https://api.betternow.org/fundraisers
```

The `rel=next` relation in the `Link` header may also be used.

If the list is empty, a `204 No Content` status with the correct range headers
and an empty request body will be returned.

## JSON Schema

The machine-readable version of the API documentation is
[schema.json](/schema.json). You can use tools like
[committee](https://github.com/interagent/committee) with the schema to test and
stub a local version of the api when you're developing your client.

## "Sub-resources"

When resources are related to other resources (e.g. a list of Projects that can
be supported for one Organisation, or a list of Fundraising Pages that are
members of one Team), they will be represented as a reference to an url that can
be dereferenced to return a list of the embedded resources.

Clients should prefer following the url included in the parent resource rather
then constructing their own urls.

# Example Usage

On the right you can see two examples for how to retrieve a fundraiser via the
API.

## curl example

```shell
# Save api credentials in .netrc, for use with `curl -n`
#
# You can use any email address as the `login`. We will only use the email address to
# contact you in case we see problems with your API client.
#
# You can use either your `publishable` or `secret key` as the `password`.
#
cat >> ~/.netrc
machine api.betternow.org
  login <YOUR EMAIL ADDRESS>
  password <YOUR API KEY>


curl -n -sS -i -H 'Accept: application/vnd.betternow+json; version=1' \
  https://api.betternow.org/fundraisers/<REPLACE_WITH_YOUR_FUNDRAISER_ID_OR_SLUG>
```

## HTML/Javascript (browser) example

```html
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>BetterNow API browser client example</title>
    <script>

      // Base64 encoding function
      var Base64={_keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",encode:function(e){var t="";var n,r,i,s,o,u,a;var f=0;e=Base64._utf8_encode(e);while(f<e.length){n=e.charCodeAt(f++);r=e.charCodeAt(f++);i=e.charCodeAt(f++);s=n>>2;o=(n&3)<<4|r>>4;u=(r&15)<<2|i>>6;a=i&63;if(isNaN(r)){u=a=64}else if(isNaN(i)){a=64}t=t+this._keyStr.charAt(s)+this._keyStr.charAt(o)+this._keyStr.charAt(u)+this._keyStr.charAt(a)}return t},decode:function(e){var t="";var n,r,i;var s,o,u,a;var f=0;e=e.replace(/[^A-Za-z0-9\+\/\=]/g,"");while(f<e.length){s=this._keyStr.indexOf(e.charAt(f++));o=this._keyStr.indexOf(e.charAt(f++));u=this._keyStr.indexOf(e.charAt(f++));a=this._keyStr.indexOf(e.charAt(f++));n=s<<2|o>>4;r=(o&15)<<4|u>>2;i=(u&3)<<6|a;t=t+String.fromCharCode(n);if(u!=64){t=t+String.fromCharCode(r)}if(a!=64){t=t+String.fromCharCode(i)}}t=Base64._utf8_decode(t);return t},_utf8_encode:function(e){e=e.replace(/\r\n/g,"\n");var t="";for(var n=0;n<e.length;n++){var r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r)}else if(r>127&&r<2048){t+=String.fromCharCode(r>>6|192);t+=String.fromCharCode(r&63|128)}else{t+=String.fromCharCode(r>>12|224);t+=String.fromCharCode(r>>6&63|128);t+=String.fromCharCode(r&63|128)}}return t},_utf8_decode:function(e){var t="";var n=0;var r=c1=c2=0;while(n<e.length){r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r);n++}else if(r>191&&r<224){c2=e.charCodeAt(n+1);t+=String.fromCharCode((r&31)<<6|c2&63);n+=2}else{c2=e.charCodeAt(n+1);c3=e.charCodeAt(n+2);t+=String.fromCharCode((r&15)<<12|(c2&63)<<6|c3&63);n+=3}}return t}}

      // This can be any email address - we will use it to contact you in case
      // we are seeing issues with your API client
      var yourEmailAddress = "<REPLACE WITH YOUR EMAIL>"

      // You could also use your secret key here, if accessing an endpoint that
      // requires it.
      var publishableKey = "<REPLACE WITH YOUR API KEY>";

      // This is just an example for retrieving a fundraiser. If you would
      // rather use another endpoint, you can change the url used in the
      // `xhr.open` line below.
      var fundraiserSlugOrId = "<REPLACE WITH A FUNDRAISER ID or SLUG>";

      // Create a new request object
      var xhr = new XMLHttpRequest();

      // Setup the URL for the request
      xhr.open("get", "https://api.betternow.org/fundraisers/" + fundraiserSlugOrId, true);

      // Encode the email & token, and set the required `Authorization` header
      xhr.setRequestHeader("Authorization", "Bearer " + Base64.encode(yourEmailAddress + ":" + publishableKey))

      // Set the required `Accept` header
      xhr.setRequestHeader("Accept", "application/vnd.betternow+json; version=1");

      // Add a handler for the response
      xhr.onload = function() {
        alert(this.responseText);
      }

      // Send the request
      xhr.send();
    </script>
  </head>
  <body>
    <p>If you don't get an alert something is wrong...</p>
  </body>
</html>
```

