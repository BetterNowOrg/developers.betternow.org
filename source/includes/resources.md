
# API Endpoints/Resources

Following is a list of the endpoints/resources that are available via the api,
the operations that are supported for each resource, and examples of response
data.

The `curl` examples use the `-n` flag to authenticate using the `.netrc` file.
For more information about configuring your `.netrc` see the [curl example
above](/#curl-example).


## <a name="resource-common">Common definitions</a>


Common definitions used by multiple resources


## <a name="resource-contact_permission">Contact Permission</a>


Information about the contact permissions gathered in connection with the creation of a Fundraiser, Donation or Team. Depending on the configuration for the region/site/organisation more or less detail will be available. A secret key is required to access this information.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **[allow_organisation_contact](#resource-common)** | *boolean* | If the person has consented to be contacted by the organisation | `true` |
| **allow_site_contact** | *boolean* | If the person has consented to be contacted by the site. If the value is null, the person has not been asked | `false` |
| **[created_at](#resource-common)** | *date-time* | when resource was created | `"2012-01-01T12:00:00Z"` |
| **[id](#resource-common)** | *string* | unique identifier | `1234567` |
| **organisation_contact_methods:email** | *boolean* | If the person has agreed to be contacted via the method. If the value is null, the person has not been asked about specific contact methods. | `true` |
| **organisation_contact_methods:phone** | *boolean* | If the person has agreed to be contacted via the method. If the value is null, the person has not been asked about specific contact methods. | `true` |
| **organisation_contact_methods:post** | *boolean* | If the person has agreed to be contacted via the method. If the value is null, the person has not been asked about specific contact methods. | `true` |
| **organisation_contact_methods:sms** | *boolean* | If the person has agreed to be contacted via the method. If the value is null, the person has not been asked about specific contact methods. | `true` |
| **[person:avatar_url](#resource-user)** | *uri* | The URL for the avatar image for the user. 92x92 pixels | `"https://cdn.example.net/avatar.jpg"` |
| **[person:first_name](#resource-user)** | *string* | The first name of the user | `"Firstname"` |
| **[person:last_name](#resource-user)** | *string* | The last name of the user | `"Lastname"` |
| **[person:middle_name](#resource-user)** | *string* | The middle name of the user | `"Middlename"` |
| **[person:private_person_url](#resource-user)** | *uri* | The URL to retreive private information about the user. A secret key is required for this URL | `"https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"` |
| **[recipient:html_url](#resource-common)** | *uri* | The current url to view the organisation page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/charities/helpnow"` |
| **[recipient:id](#resource-common)** | *string* | Unique identifier of organisation | `1234567` |
| **[recipient:name](#resource-common)** | *string* | The name of the Organisation | `"HelpNow"` |
| **[recipient:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/organisations/1234567"` |
| **site_contact_methods:email** | *boolean* | If the person has agreed to be contacted via the method. If the value is null, the person has not been asked about specific contact methods. | `true` |
| **site_contact_methods:phone** | *boolean* | If the person has agreed to be contacted via the method. If the value is null, the person has not been asked about specific contact methods. | `true` |
| **site_contact_methods:post** | *boolean* | If the person has agreed to be contacted via the method. If the value is null, the person has not been asked about specific contact methods. | `true` |
| **site_contact_methods:sms** | *boolean* | If the person has agreed to be contacted via the method. If the value is null, the person has not been asked about specific contact methods. | `true` |
| **[source:source_id](#resource-common)** | *string* | unique identifier | `1234567` |
| **source:source_type** | *string* | <br/> **one of:**`"Donation"` or `"Fundraiser"` or `"Team"` | `"Donation"` |
| **[source:url](#resource-common)** | *uri* |  | `"https://url.example.net"` |
| **[url](#resource-common)** | *uri* |  | `"https://url.example.net"` |

### Contact Permission Info

Info for existing donation.

```
GET /contact-permissions/{contact_permission_id}
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/contact-permissions/$CONTACT_PERMISSION_ID \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "allow_organisation_contact": true,
  "allow_site_contact": false,
  "created_at": "2012-01-01T12:00:00Z",
  "id": 1234567,
  "organisation_contact_methods": {
    "email": true,
    "post": true,
    "sms": true,
    "phone": true
  },
  "site_contact_methods": {
    "email": true,
    "post": true,
    "sms": true,
    "phone": true
  },
  "person": {
    "avatar_url": "https://cdn.example.net/avatar.jpg",
    "first_name": "Firstname",
    "middle_name": "Middlename",
    "last_name": "Lastname",
    "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
  },
  "recipient": {
    "id": 1234567,
    "name": "HelpNow",
    "url": "https://api.betternow.org/organisations/1234567",
    "html_url": "https://dk.betternow.org/charities/helpnow"
  },
  "source": {
    "source_type": "Donation",
    "source_id": 1234567,
    "url": "https://url.example.net"
  },
  "url": "https://url.example.net"
}
```


## <a name="resource-donation">Donation</a>


The publicly available details about a donation

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **[allow_organisation_contact](#resource-common)** | *boolean* | If the person has consented to be contacted by the organisation | `true` |
| **amount:cents** | *integer* | Numeric amount in cents | `12345` |
| **amount:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **comment** | *string* | The comment given with the donation | `"Wow, what a great idea!"` |
| **created_at** | *date-time* | when donation was created | `"2012-01-01T12:00:00Z"` |
| **[event:html_url](#resource-common)** | *uri* | The url to the Event page on BetterNow | `"https://dk.betternow.org/events/copenhagen-marathon-2013"` |
| **[event:id](#resource-common)** | *string* | unique identifier of event | `1234567` |
| **[event:name](#resource-common)** | *string* | the name of the Event | `"Copenhagen Marathon 2013"` |
| **[event:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/events/1234567"` |
| **[fundraiser:html_url](#resource-common)** | *uri* | The current url to view the organisation page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/charities/helpnow"` |
| **[fundraiser:id](#resource-common)** | *string* | Unique identifier of organisation | `1234567` |
| **[fundraiser:name](#resource-common)** | *string* | The name of the Organisation | `"HelpNow"` |
| **[fundraiser:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/organisations/1234567"` |
| **id** | *integer* | unique identifier of donation | `1234567` |
| **name** | *string* | The name on the donation | `"Joes Truck Stop"` |
| **private_details_url** | *uri* | An url where private information about the donation and donor can be retrieved. Requires a secret key. | `"https://api.betternow.org/donation-details/542e5f3b-7d8e-475c-8d25-5a2c0742672d"` |
| **[project:html_url](#resource-common)** | *uri* | The current url to view the project page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/projects/helpnow-projekt"` |
| **[project:id](#resource-common)** | *string* | Unique identifier of project | `1234567` |
| **[project:name](#resource-common)** | *string* | The name of the Project | `"HelpNows generelle arbejde"` |
| **[project:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/projects/1234567"` |
| **[recipient:html_url](#resource-common)** | *uri* | The current url to view the organisation page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/charities/helpnow"` |
| **[recipient:id](#resource-common)** | *string* | Unique identifier of organisation | `1234567` |
| **[recipient:name](#resource-common)** | *string* | The name of the Organisation | `"HelpNow"` |
| **[recipient:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/organisations/1234567"` |
| **[team:html_url](#resource-common)** | *uri* | The url to the Team page on BetterNow | `"https://dk.betternow.org/teams/team-novo"` |
| **[team:id](#resource-common)** | *string* | unique identifier of team | `1234567` |
| **[team:name](#resource-common)** | *string* | the name of the Team | `"Team NOVO"` |
| **[team:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/team/1234567"` |
| **updated_at** | *date-time* | when donation was updated | `"2012-01-01T12:00:00Z"` |
| **[your_reference](#resource-project)** | *string* | A string that you can use to identify the project and its fundraisers and donations. The value will be inherited by any fundraisers created for the project and any donations made via the fundraisers. Commonly used to assign donations to e.g. a campaign in your CRM system. You can set this value in the dashboard for your project. | `"my-crm-project-reference-123456"` |

### Donation Info

Info for existing donation.

```
GET /donations/{donation_id}
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/donations/$DONATION_ID \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "amount": {
    "cents": 12345,
    "currency": "EUR"
  },
  "allow_organisation_contact": true,
  "comment": "Wow, what a great idea!",
  "created_at": "2012-01-01T12:00:00Z",
  "id": 1234567,
  "private_details_url": "https://api.betternow.org/donation-details/542e5f3b-7d8e-475c-8d25-5a2c0742672d",
  "name": "Joes Truck Stop",
  "updated_at": "2012-01-01T12:00:00Z",
  "fundraiser": {
    "id": 1234567,
    "name": "HelpNow",
    "url": "https://api.betternow.org/organisations/1234567",
    "html_url": "https://dk.betternow.org/charities/helpnow"
  },
  "recipient": {
    "id": 1234567,
    "name": "HelpNow",
    "url": "https://api.betternow.org/organisations/1234567",
    "html_url": "https://dk.betternow.org/charities/helpnow"
  },
  "team": {
    "id": 1234567,
    "name": "Team NOVO",
    "url": "https://api.betternow.org/team/1234567",
    "html_url": "https://dk.betternow.org/teams/team-novo"
  },
  "project": {
    "id": 1234567,
    "name": "HelpNows generelle arbejde",
    "url": "https://api.betternow.org/projects/1234567",
    "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
  },
  "event": {
    "id": 1234567,
    "name": "Copenhagen Marathon 2013",
    "url": "https://api.betternow.org/events/1234567",
    "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
  },
  "your_reference": "my-crm-project-reference-123456"
}
```


## <a name="resource-donation-detail">Donation Details</a>


The private details about a donation. Includes Personally Identifieable Information. A secret key is required to access this information.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **address:city** | *string* |  | `"Copenhagen K"` |
| **address:country** | *string* | ISO alpha-2 country code<br/> **pattern:** `^([A-Z]{2})$` | `"DK"` |
| **address:postal_code** | *string* |  | `"1434"` |
| **address:province** | *string* |  | `"Region Hovedstaden"` |
| **address:street_line_1** | *string* |  | `"Danneskiold-Samsøes Allé 41"` |
| **address:street_line_2** | *string* |  | `"Suite 103"` |
| **allow_organisation_contact** | *boolean* | Has the donor given permission for the recipient of the donation to contact them? | `true` |
| **allow_site_contact** | *boolean* | Has the donor given permission for the operator of the site on which the donation was given to contact them? | `true` |
| **amount:cents** | *integer* | Numeric amount in cents | `12345` |
| **amount:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **[comment](#resource-donation)** | *string* | The comment given with the donation | `"Wow, what a great idea!"` |
| **company_name** | *string* |  | `"BetterNow Worldwide ApS"` |
| **[created_at](#resource-donation)** | *date-time* | when donation was created | `"2012-01-01T12:00:00Z"` |
| **[custom_form_values](#resource-common)** | *object* | An object containing values for custom form fields. Structure varies depending on the customer. |  |
| **[donor:allow_site_contact](#resource-person)** | *boolean* | true if the user has agreed to be contacted by the site they either donated via or signed up on. | `true` |
| **[donor:birth_day](#resource-person)** | *integer* | <br/> **Range:** `1 <= value <= 31` | `1` |
| **[donor:birth_month](#resource-person)** | *integer* | <br/> **Range:** `1 <= value <= 12` | `1` |
| **[donor:created_at](#resource-user)** | *date-time* | when user was created | `"2012-01-01T12:00:00Z"` |
| **donor:donations:count** | *integer* | The count of all donations made by this person | `123` |
| **donor:donations:total_donated:cents** | *integer* | Numeric amount in cents | `1234500` |
| **donor:donations:total_donated:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **[donor:donations:url](#resource-common)** | *uri* | The url to retrieve details on all donations made by this person | `"https://api.betternow.org/people/fdb6cd2a-3ca7-40db-8fae-135daebecdab/donations"` |
| **[donor:email](#resource-person)** | *string* |  | `"user@example.com"` |
| **[donor:first_name](#resource-user)** | *string* | The first name of the user | `"Firstname"` |
| **donor:fundraisers:count** | *integer* | The number of active fundraisers | `12` |
| **[donor:fundraisers:url](#resource-common)** | *uri* | The url to retrieve all fundraisers | `"https://api.betternow.org/people/fdb6cd2a-3ca7-40db-8fae-135daebecdab/fundraisers"` |
| **[donor:id](#resource-person)** | *string* | unique identifier of person | `"fdb6cd2a-3ca7-40db-8fae-135daebecdab"` |
| **[donor:last_name](#resource-user)** | *string* | The last name of the user | `"Lastname"` |
| **[donor:locale](#resource-person)** | *string* | ISO 639-1 locale code | `"en"` |
| **[donor:middle_name](#resource-user)** | *string* | The middle name of the user | `"Middlename"` |
| **[donor:partner_reference](#resource-person)** | *string* | This is an external identifier that is intended to be used in linking partner systems to BetterNow. The partner reference can be supplied when creating a user. | `"example"` |
| **[donor:phone](#resource-person)** | *string* | Phone number in E.164 format | `"+4510101010"` |
| **donor:teams:count** | *integer* | The number of teams | `12` |
| **[donor:teams:url](#resource-common)** | *uri* | The url to retrieve all teams | `"https://api.betternow.org/people/fdb6cd2a-3ca7-40db-8fae-135daebecdab/teams"` |
| **[donor:title](#resource-person)** | *string* |  | `"Director of Personal Fundraising"` |
| **[donor:url](#resource-user)** | *uri* | The URL to retreive private information about the user. A secret key is required for this URL | `"https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"` |
| **donor_ip_address** | *string* |  | `"127.0.0.1"` |
| **donor_type** | *string* | <br/> **one of:**`"unknown"` or `"personal"` or `"organisation"` | `"personal"` |
| **[event:html_url](#resource-common)** | *uri* | The url to the Event page on BetterNow | `"https://dk.betternow.org/events/copenhagen-marathon-2013"` |
| **[event:id](#resource-common)** | *string* | unique identifier of event | `1234567` |
| **[event:name](#resource-common)** | *string* | the name of the Event | `"Copenhagen Marathon 2013"` |
| **[event:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/events/1234567"` |
| **[first_name](#resource-user)** | *string* | The first name of the user | `"Firstname"` |
| **[fundraiser:html_url](#resource-common)** | *uri* | The current url to view the organisation page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/charities/helpnow"` |
| **[fundraiser:id](#resource-common)** | *string* | Unique identifier of organisation | `1234567` |
| **[fundraiser:name](#resource-common)** | *string* | The name of the Organisation | `"HelpNow"` |
| **[fundraiser:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/organisations/1234567"` |
| **hidden_name** | *boolean* | Has the donor requested to hide their name (donate anonymously on the public site)? | `true` |
| **[id](#resource-donation)** | *integer* | unique identifier of donation | `1234567` |
| **[last_name](#resource-user)** | *string* | The last name of the user | `"Lastname"` |
| **legal_name** | *string* |  | `"BetterNow LTD"` |
| **[middle_name](#resource-user)** | *string* | The middle name of the user | `"Middlename"` |
| **[name_shown](#resource-donation)** | *string* | The name on the donation | `"Joes Truck Stop"` |
| **payment:acquirer** | *string* | What company acquires the payment | `"clearhaus"` |
| **payment:payment_id_for_processor** | *string* | the id we send to the payment processor and acquirer | `"12345-slyellei_0"` |
| **payment:processor_id** | *string* | the payment processor's id for the payment | `"123456789"` |
| **payment:settled_by_betternow** | *boolean* | If BetterNow transfers the money to you | `false` |
| **[project:html_url](#resource-common)** | *uri* | The current url to view the project page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/projects/helpnow-projekt"` |
| **[project:id](#resource-common)** | *string* | Unique identifier of project | `1234567` |
| **[project:name](#resource-common)** | *string* | The name of the Project | `"HelpNows generelle arbejde"` |
| **[project:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/projects/1234567"` |
| **[recipient:html_url](#resource-common)** | *uri* | The current url to view the organisation page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/charities/helpnow"` |
| **[recipient:id](#resource-common)** | *string* | Unique identifier of organisation | `1234567` |
| **[recipient:name](#resource-common)** | *string* | The name of the Organisation | `"HelpNow"` |
| **[recipient:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/organisations/1234567"` |
| **tax_deduction_requested** | *boolean* | whether the donor requested a tax deduction (or Gift Aid in UK) | `false` |
| **tax_id** | *string* | country-specific tax identification number | `"example"` |
| **[team:html_url](#resource-common)** | *uri* | The url to the Team page on BetterNow | `"https://dk.betternow.org/teams/team-novo"` |
| **[team:id](#resource-common)** | *string* | unique identifier of team | `1234567` |
| **[team:name](#resource-common)** | *string* | the name of the Team | `"Team NOVO"` |
| **[team:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/team/1234567"` |
| **[updated_at](#resource-donation)** | *date-time* | when donation was updated | `"2012-01-01T12:00:00Z"` |
| **[url](#resource-donation)** | *uri* | An url where private information about the donation and donor can be retrieved. Requires a secret key. | `"https://api.betternow.org/donation-details/542e5f3b-7d8e-475c-8d25-5a2c0742672d"` |
| **[your_reference](#resource-project)** | *string* | A string that you can use to identify the project and its fundraisers and donations. The value will be inherited by any fundraisers created for the project and any donations made via the fundraisers. Commonly used to assign donations to e.g. a campaign in your CRM system. You can set this value in the dashboard for your project. | `"my-crm-project-reference-123456"` |

### Donation Details Info

Info for existing donation.

```
GET /donation-details/{donation_id}
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/donation-details/$DONATION_ID \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "amount": {
    "cents": 12345,
    "currency": "EUR"
  },
  "comment": "Wow, what a great idea!",
  "name_shown": "Joes Truck Stop",
  "hidden_name": true,
  "first_name": "Firstname",
  "middle_name": "Middlename",
  "last_name": "Lastname",
  "company_name": "BetterNow Worldwide ApS",
  "legal_name": "BetterNow LTD",
  "donor_type": "personal",
  "tax_id": "example",
  "tax_deduction_requested": false,
  "created_at": "2012-01-01T12:00:00Z",
  "id": 1234567,
  "updated_at": "2012-01-01T12:00:00Z",
  "address": {
    "street_line_1": "Danneskiold-Samsøes Allé 41",
    "street_line_2": "Suite 103",
    "city": "Copenhagen K",
    "postal_code": "1434",
    "province": "Region Hovedstaden",
    "country": "DK"
  },
  "fundraiser": {
    "id": 1234567,
    "name": "HelpNow",
    "url": "https://api.betternow.org/organisations/1234567",
    "html_url": "https://dk.betternow.org/charities/helpnow"
  },
  "recipient": {
    "id": 1234567,
    "name": "HelpNow",
    "url": "https://api.betternow.org/organisations/1234567",
    "html_url": "https://dk.betternow.org/charities/helpnow"
  },
  "team": {
    "id": 1234567,
    "name": "Team NOVO",
    "url": "https://api.betternow.org/team/1234567",
    "html_url": "https://dk.betternow.org/teams/team-novo"
  },
  "project": {
    "id": 1234567,
    "name": "HelpNows generelle arbejde",
    "url": "https://api.betternow.org/projects/1234567",
    "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
  },
  "event": {
    "id": 1234567,
    "name": "Copenhagen Marathon 2013",
    "url": "https://api.betternow.org/events/1234567",
    "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
  },
  "donor_ip_address": "127.0.0.1",
  "allow_organisation_contact": true,
  "allow_site_contact": true,
  "url": "https://api.betternow.org/donation-details/542e5f3b-7d8e-475c-8d25-5a2c0742672d",
  "donor": {
    "id": "fdb6cd2a-3ca7-40db-8fae-135daebecdab",
    "first_name": "Firstname",
    "middle_name": "Middlename",
    "last_name": "Lastname",
    "email": "user@example.com",
    "phone": "+4510101010",
    "title": "Director of Personal Fundraising",
    "created_at": "2012-01-01T12:00:00Z",
    "birth_month": 1,
    "birth_day": 1,
    "locale": "en",
    "allow_site_contact": true,
    "partner_reference": "example",
    "url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/people/fdb6cd2a-3ca7-40db-8fae-135daebecdab/donations"
    },
    "fundraisers": {
      "count": 12,
      "url": "https://api.betternow.org/people/fdb6cd2a-3ca7-40db-8fae-135daebecdab/fundraisers"
    },
    "teams": {
      "count": 12,
      "url": "https://api.betternow.org/people/fdb6cd2a-3ca7-40db-8fae-135daebecdab/teams"
    }
  },
  "your_reference": "my-crm-project-reference-123456",
  "custom_form_values": null,
  "payment": {
    "processor_id": "123456789",
    "payment_id_for_processor": "12345-slyellei_0",
    "settled_by_betternow": false,
    "acquirer": "clearhaus"
  }
}
```


## <a name="resource-event">Event</a>


An Event is something that takes place at a particular time and/or place. It could be a sporting event like the Copenhagen Marathon 2013, or a holiday like Christmas 2014

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **activity_score** | *integer* | A number that can be used for sorting lists of events. More recently active events should have a higher activity score than events who have raised more money long ago. | `987654321` |
| **[choose_project_to_fundraise_for_url](#resource-common)** | *uri* | The url on BetterNow for people who want to fundraise in connection with an event | `"https://www.betternow.org/dk/fundraisers/new?event_id=1234567"` |
| **[cover_media:image:url](#resource-common)** | *uri* | The url for the image. On the BetterNow site, the video takes precedence if both exist. 461x306 pixels | `"https://cnd.example.net/image.jpg"` |
| **[cover_media:thumb:url](#resource-common)** | *uri* | The url for the cover media that should be displayed in e.g. a card view. 120x80 pixels | `"https://cnd.example.net/image.jpg"` |
| **cover_media:video:oembed_html** | *string* | The OEmbed HTML to display the video. Could be blank. | `"<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"` |
| **[cover_media:video:url](#resource-common)** | *uri* | The url for the video. Currently only YouTube and Vimeo are supported. Could be blank. | `"https://youtu.be/12345"` |
| **[created_at](#resource-common)** | *date-time* | when event was created | `"2012-01-01T12:00:00Z"` |
| **[description](#resource-common)** | *string* | Text describing the Event added by the event organiser. Contains HTML. | `"<p>This is really, <b>REALLY</b> great</p> <br><br>"` |
| **donations:count** | *integer* | The count of all donations made via this Event | `123` |
| **donations:total_donated:cents** | *integer* | Numeric amount in cents | `1234500` |
| **donations:total_donated:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **[donations:url](#resource-common)** | *uri* | The url to retrieve details on all donations made via this Event | `"https://api.betternow.org/events/1234567/donations"` |
| **end_date** | *date-time* | The date when the Event ends. May be blank in the case of a single day event. | `"2012-01-01"` |
| **fundraisers:count** | *integer* | The number of active fundraisers | `12` |
| **[fundraisers:url](#resource-common)** | *uri* | The url to retrieve all fundraisers | `"https://api.betternow.org/events/1234567/fundraisers"` |
| **[html_url](#resource-common)** | *uri* | The url to the Event page on BetterNow | `"https://dk.betternow.org/events/copenhagen-marathon-2013"` |
| **[id](#resource-common)** | *string* | unique identifier of event | `1234567` |
| **location:city** | *string* | The name of a city | `"København"` |
| **[logo_url](#resource-common)** | *uri* | The logo for the Event | `"https://cdn.example.net/logo.png"` |
| **[name](#resource-common)** | *string* | the name of the Event | `"Copenhagen Marathon 2013"` |
| **[slug](#resource-common)** | *string* | The current url path component to identify the event. This can, and does, change.<br/> **pattern:** `^([a-z0-9-]{2,})$` | `"cph-marathon-2013"` |
| **start_date** | *date-time* | The date when the Event starts | `"2012-01-01"` |
| **[updated_at](#resource-common)** | *date-time* | when event was updated | `"2012-01-01T12:00:00Z"` |
| **[url](#resource-common)** | *uri* |  | `"https://api.betternow.org/events/1234567"` |

### Event Info

Info for existing event.

```
GET /events/{event_id_or_slug}
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/events/$EVENT_ID_OR_SLUG \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
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
  "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013",
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

```
GET /events
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/events \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
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
    "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013",
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

```
GET /events/{event_id_or_slug}/projects
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/events/$EVENT_ID_OR_SLUG/projects \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
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
    "html_url": "https://dk.betternow.org/projects/helpnow-projekt",
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
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "slug": "helpnow-project",
    "state": "published",
    "your_reference": "my-crm-project-reference-123456"
  }
]
```

### Event List Fundraisers

List all Fundraisers associated with an Event

```
GET /events/{event_id_or_slug}/fundraisers
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/events/$EVENT_ID_OR_SLUG/fundraisers \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "activity_score": 987654321,
    "allow_organisation_contact": true,
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
    "state": "published",
    "fundraiser_type": "birthday",
    "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/fundraisers/1234567/donations"
    },
    "end_date": "2012-01-01",
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "headline": "Firstname Lastname's Fundraiser for HelpNow",
    "html_url": "https://dk.betternow.org/fundraisers/firstname-lastnames-fundraiser-for-helpnow",
    "id": 1234567,
    "owner": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "middle_name": "Middlename",
      "last_name": "Lastname",
      "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
    },
    "partner_data": null,
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://dk.betternow.org/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
    },
    "slug": "firstname-lastnames-fundraiser-for-helpnow",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/fundraisers/1234567",
    "your_reference": "my-crm-project-reference-123456",
    "honoree": "Dorthe Jensen Hansen",
    "birth_date": "2012-01-01",
    "death_date": "2012-01-01",
    "funeral_date": "2012-01-01"
  }
]
```

### Event List Teams

List all Teams associated with an Event

```
GET /events/{event_id_or_slug}/teams
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/events/$EVENT_ID_OR_SLUG/teams \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "captain": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "middle_name": "Middlename",
      "last_name": "Lastname",
      "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
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
      "captain_name": "Helle Hansen",
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
    "html_url": "https://dk.betternow.org/teams/team-novo",
    "id": 1234567,
    "logo_url": "https://cdn.example.net/logo.png",
    "name": "Team NOVO",
    "partner_data": null,
    "slug": "team-novo",
    "state": "published",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/team/1234567"
  }
]
```


## <a name="resource-fundraiser">Fundraising Page</a>


Detailed information about a single Fundraising Page on BetterNow.org

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **activity_score** | *integer* | A number that can be used for sorting lists of fundraisers. More recently active fundraisers should have a higher activity score than fundraisers who have raised more money long ago. | `987654321` |
| **[allow_organisation_contact](#resource-common)** | *boolean* | If the person has consented to be contacted by the organisation | `true` |
| **birth_date** | *date* | The day the person who a tribute_fund fundraiser is honoring was born. | `"2012-01-01"` |
| **[cover_media:image:url](#resource-common)** | *uri* | The url for the image. On the BetterNow site, the video takes precedence if both exist. 461x306 pixels | `"https://cnd.example.net/image.jpg"` |
| **[cover_media:thumb:url](#resource-common)** | *uri* | The url for the cover media that should be displayed in e.g. a card view. 120x80 pixels | `"https://cnd.example.net/image.jpg"` |
| **cover_media:video:oembed_html** | *string* | The OEmbed HTML to display the video. Could be blank. | `"<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"` |
| **[cover_media:video:url](#resource-common)** | *uri* | The url for the video. Currently only YouTube and Vimeo are supported. Could be blank. | `"https://youtu.be/12345"` |
| **[created_at](#resource-common)** | *date-time* | when resource was created | `"2012-01-01T12:00:00Z"` |
| **death_date** | *date* | The day the person who a tribute_fund fundraiser is honoring died. | `"2012-01-01"` |
| **[description](#resource-common)** | *string* | The text written by the fundraiser owner. Contains HTML. | `"<p>This is really, <b>REALLY</b> great</p> <br><br>"` |
| **donate_url** | *uri* | The current url to donate via the fundraising page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new"` |
| **donations:count** | *integer* | The count of all donations made to this fundraiser | `123` |
| **donations:total_donated:cents** | *integer* | Numeric amount in cents | `1234500` |
| **donations:total_donated:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **[donations:url](#resource-common)** | *uri* | The url to retrieve details on all donations made to this fundraiser | `"https://api.betternow.org/fundraisers/1234567/donations"` |
| **end_date** | *date* | The end date for a fundraiser. | `"2012-01-01"` |
| **[event:html_url](#resource-common)** | *uri* | The url to the Event page on BetterNow | `"https://dk.betternow.org/events/copenhagen-marathon-2013"` |
| **[event:id](#resource-common)** | *string* | unique identifier of event | `1234567` |
| **[event:name](#resource-common)** | *string* | the name of the Event | `"Copenhagen Marathon 2013"` |
| **[event:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/events/1234567"` |
| **fundraiser_type** | *string* | The type of the fundraiser on BetterNow<br/> **one of:**`"birthday"` or `"anniversary"` or `"in_memory_of"` or `"sports_event"` or `"corporate"` or `"cultural_event"` or `"sponsorable"` or `"tribute_fund"` or `"other"` | `"birthday"` |
| **funeral_date** | *date* | The date of the funeral for the person who a tribute_fund fundraiser is honoring. | `"2012-01-01"` |
| **goal:cents** | *integer* | Numeric amount in cents | `1234500` |
| **goal:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **[headline](#resource-common)** | *string* | The headline for this fundraising page | `"Firstname Lastname's Fundraiser for HelpNow"` |
| **honoree** | *string* | The name of the person who a tribute_fund fundraiser is honoring | `"Dorthe Jensen Hansen"` |
| **[html_url](#resource-common)** | *uri* | The current url to view the fundraising page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/fundraisers/firstname-lastnames-fundraiser-for-helpnow"` |
| **[id](#resource-common)** | *string* | The unique identifier of the fundraising page | `1234567` |
| **[owner:avatar_url](#resource-user)** | *uri* | The URL for the avatar image for the user. 92x92 pixels | `"https://cdn.example.net/avatar.jpg"` |
| **[owner:first_name](#resource-user)** | *string* | The first name of the user | `"Firstname"` |
| **[owner:last_name](#resource-user)** | *string* | The last name of the user | `"Lastname"` |
| **[owner:middle_name](#resource-user)** | *string* | The middle name of the user | `"Middlename"` |
| **[owner:private_person_url](#resource-user)** | *uri* | The URL to retreive private information about the user. A secret key is required for this URL | `"https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"` |
| **[partner_data](#resource-common)** | *object* | An object containing data from partner systems. Structure varies depending on the partner. |  |
| **[project:html_url](#resource-common)** | *uri* | The current url to view the project page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/projects/helpnow-projekt"` |
| **[project:id](#resource-common)** | *string* | Unique identifier of project | `1234567` |
| **[project:name](#resource-common)** | *string* | The name of the Project | `"HelpNows generelle arbejde"` |
| **[project:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/projects/1234567"` |
| **[recipient:html_url](#resource-common)** | *uri* | The current url to view the organisation page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/charities/helpnow"` |
| **[recipient:id](#resource-common)** | *string* | Unique identifier of organisation | `1234567` |
| **[recipient:name](#resource-common)** | *string* | The name of the Organisation | `"HelpNow"` |
| **[recipient:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/organisations/1234567"` |
| **[slug](#resource-common)** | *string* | The current url path component to identify the fundraiser. This can, and does, change.<br/> **pattern:** `^([a-z0-9-]{2,})$` | `"firstname-lastnames-fundraiser-for-helpnow"` |
| **[state](#resource-common)** | *string* | The state of this fundraiser | `"published"` |
| **[team:html_url](#resource-common)** | *uri* | The url to the Team page on BetterNow | `"https://dk.betternow.org/teams/team-novo"` |
| **[team:id](#resource-common)** | *string* | unique identifier of team | `1234567` |
| **[team:name](#resource-common)** | *string* | the name of the Team | `"Team NOVO"` |
| **[team:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/team/1234567"` |
| **[updated_at](#resource-common)** | *date-time* | when resource was updated | `"2012-01-01T12:00:00Z"` |
| **[url](#resource-common)** | *uri* |  | `"https://api.betternow.org/fundraisers/1234567"` |
| **[your_reference](#resource-project)** | *string* | A string that you can use to identify the project and its fundraisers and donations. The value will be inherited by any fundraisers created for the project and any donations made via the fundraisers. Commonly used to assign donations to e.g. a campaign in your CRM system. You can set this value in the dashboard for your project. | `"my-crm-project-reference-123456"` |

### Fundraising Page Info

Info for existing fundraiser.

```
GET /fundraisers/{fundraiser_id_or_slug}
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/fundraisers/$FUNDRAISER_ID_OR_SLUG \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "activity_score": 987654321,
  "allow_organisation_contact": true,
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
  "state": "published",
  "fundraiser_type": "birthday",
  "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
  "donations": {
    "count": 123,
    "total_donated": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "url": "https://api.betternow.org/fundraisers/1234567/donations"
  },
  "end_date": "2012-01-01",
  "goal": {
    "cents": 1234500,
    "currency": "EUR"
  },
  "headline": "Firstname Lastname's Fundraiser for HelpNow",
  "html_url": "https://dk.betternow.org/fundraisers/firstname-lastnames-fundraiser-for-helpnow",
  "id": 1234567,
  "owner": {
    "avatar_url": "https://cdn.example.net/avatar.jpg",
    "first_name": "Firstname",
    "middle_name": "Middlename",
    "last_name": "Lastname",
    "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
  },
  "partner_data": null,
  "recipient": {
    "id": 1234567,
    "name": "HelpNow",
    "url": "https://api.betternow.org/organisations/1234567",
    "html_url": "https://dk.betternow.org/charities/helpnow"
  },
  "team": {
    "id": 1234567,
    "name": "Team NOVO",
    "url": "https://api.betternow.org/team/1234567",
    "html_url": "https://dk.betternow.org/teams/team-novo"
  },
  "project": {
    "id": 1234567,
    "name": "HelpNows generelle arbejde",
    "url": "https://api.betternow.org/projects/1234567",
    "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
  },
  "event": {
    "id": 1234567,
    "name": "Copenhagen Marathon 2013",
    "url": "https://api.betternow.org/events/1234567",
    "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
  },
  "slug": "firstname-lastnames-fundraiser-for-helpnow",
  "updated_at": "2012-01-01T12:00:00Z",
  "url": "https://api.betternow.org/fundraisers/1234567",
  "your_reference": "my-crm-project-reference-123456",
  "honoree": "Dorthe Jensen Hansen",
  "birth_date": "2012-01-01",
  "death_date": "2012-01-01",
  "funeral_date": "2012-01-01"
}
```

### Fundraising Page List

List existing fundraisers.

```
GET /fundraisers
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/fundraisers \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "activity_score": 987654321,
    "allow_organisation_contact": true,
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
    "state": "published",
    "fundraiser_type": "birthday",
    "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/fundraisers/1234567/donations"
    },
    "end_date": "2012-01-01",
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "headline": "Firstname Lastname's Fundraiser for HelpNow",
    "html_url": "https://dk.betternow.org/fundraisers/firstname-lastnames-fundraiser-for-helpnow",
    "id": 1234567,
    "owner": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "middle_name": "Middlename",
      "last_name": "Lastname",
      "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
    },
    "partner_data": null,
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://dk.betternow.org/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
    },
    "slug": "firstname-lastnames-fundraiser-for-helpnow",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/fundraisers/1234567",
    "your_reference": "my-crm-project-reference-123456",
    "honoree": "Dorthe Jensen Hansen",
    "birth_date": "2012-01-01",
    "death_date": "2012-01-01",
    "funeral_date": "2012-01-01"
  }
]
```

### Fundraising Page Create

Create a fundraiser. Requires a secret key.

```
POST /fundraisers
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **email** | *string* |  | `"user@example.com"` |
| **first_name** | *string* | The first name of the user | `"Firstname"` |
| **last_name** | *string* | The last name of the user | `"Lastname"` |
| **name** | *string* | The headline for this fundraising page | `"Firstname Lastname's Fundraiser for HelpNow"` |
| **project_id** | *string* | Unique identifier of project | `1234567` |
| **site_id** | *integer* | unique identifier of site | `1234567` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **avatar_url** | *uri* | The url of an image to be shown in place of the owner's avatar. | `"https://example.com/image.jpg"` |
| **birth_date** | *date* | The day the person who a tribute_fund fundraiser is honoring was born. | `"2012-01-01"` |
| **death_date** | *date* | The day the person who a tribute_fund fundraiser is honoring died. | `"2012-01-01"` |
| **description** | *string* | The text written by the fundraiser owner. Contains HTML. | `"<p>This is really, <b>REALLY</b> great</p> <br><br>"` |
| **end_date** | *date* | The end date for a fundraiser. | `"2012-01-01"` |
| **event_id** | *string* | unique identifier of event | `1234567` |
| **fundraiser_type** | *string* | The type of the fundraiser on BetterNow<br/> **one of:**`"birthday"` or `"anniversary"` or `"in_memory_of"` or `"sports_event"` or `"corporate"` or `"cultural_event"` or `"sponsorable"` or `"tribute_fund"` or `"other"` | `"birthday"` |
| **funeral_date** | *date* | The date of the funeral for the person who a tribute_fund fundraiser is honoring. | `"2012-01-01"` |
| **goal:cents** | *integer* | Numeric amount in cents | `1234500` |
| **goal:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **honoree** | *string* | The name of the person who a tribute_fund fundraiser is honoring | `"Dorthe Jensen Hansen"` |
| **middle_name** | *string* | The middle name of the user | `"Middlename"` |
| **phone** | *string* | Phone number in E.164 format | `"+4510101010"` |
| **team_id** | *string* | unique identifier of team | `1234567` |


#### Curl Example

```bash
$ curl -n -X POST https://api.betternow.org/fundraisers \
  -d '{
  "name": "Firstname Lastname's Fundraiser for HelpNow",
  "email": "user@example.com",
  "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
  "goal": {
    "cents": 1234500,
    "currency": "EUR"
  },
  "end_date": "2012-01-01",
  "team_id": 1234567,
  "event_id": 1234567,
  "fundraiser_type": "birthday",
  "first_name": "Firstname",
  "middle_name": "Middlename",
  "last_name": "Lastname",
  "phone": "+4510101010",
  "site_id": 1234567,
  "project_id": 1234567,
  "avatar_url": "https://example.com/image.jpg",
  "honoree": "Dorthe Jensen Hansen",
  "birth_date": "2012-01-01",
  "death_date": "2012-01-01",
  "funeral_date": "2012-01-01"
}' \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "activity_score": 987654321,
  "allow_organisation_contact": true,
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
  "state": "published",
  "fundraiser_type": "birthday",
  "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
  "donations": {
    "count": 123,
    "total_donated": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "url": "https://api.betternow.org/fundraisers/1234567/donations"
  },
  "end_date": "2012-01-01",
  "goal": {
    "cents": 1234500,
    "currency": "EUR"
  },
  "headline": "Firstname Lastname's Fundraiser for HelpNow",
  "html_url": "https://dk.betternow.org/fundraisers/firstname-lastnames-fundraiser-for-helpnow",
  "id": 1234567,
  "owner": {
    "avatar_url": "https://cdn.example.net/avatar.jpg",
    "first_name": "Firstname",
    "middle_name": "Middlename",
    "last_name": "Lastname",
    "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
  },
  "partner_data": null,
  "recipient": {
    "id": 1234567,
    "name": "HelpNow",
    "url": "https://api.betternow.org/organisations/1234567",
    "html_url": "https://dk.betternow.org/charities/helpnow"
  },
  "team": {
    "id": 1234567,
    "name": "Team NOVO",
    "url": "https://api.betternow.org/team/1234567",
    "html_url": "https://dk.betternow.org/teams/team-novo"
  },
  "project": {
    "id": 1234567,
    "name": "HelpNows generelle arbejde",
    "url": "https://api.betternow.org/projects/1234567",
    "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
  },
  "event": {
    "id": 1234567,
    "name": "Copenhagen Marathon 2013",
    "url": "https://api.betternow.org/events/1234567",
    "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
  },
  "slug": "firstname-lastnames-fundraiser-for-helpnow",
  "updated_at": "2012-01-01T12:00:00Z",
  "url": "https://api.betternow.org/fundraisers/1234567",
  "your_reference": "my-crm-project-reference-123456",
  "honoree": "Dorthe Jensen Hansen",
  "birth_date": "2012-01-01",
  "death_date": "2012-01-01",
  "funeral_date": "2012-01-01"
}
```

### Fundraising Page List Donations

List the donations for existing fundraiser. Donations will always be returned in reverse-chronological order (newest first).

```
GET /fundraisers/{fundraiser_id_or_slug}/donations
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/fundraisers/$FUNDRAISER_ID_OR_SLUG/donations \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
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
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/donations/542e5f3b-7d8e-475c-8d25-5a2c0742672d",
    "private_details_url": "https://api.betternow.org/donation-details/542e5f3b-7d8e-475c-8d25-5a2c0742672d"
  }
]
```

### Fundraising Page List Fundraiser Updates

List the updates for existing fundraiser.

```
GET /fundraisers/{fundraiser_id_or_slug}/updates
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/fundraisers/$FUNDRAISER_ID_OR_SLUG/updates \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
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
      "middle_name": "Middlename",
      "last_name": "Lastname",
      "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
    },
    "title": "Great job everyone!",
    "updated_at": "2012-01-01T12:00:00Z"
  }
]
```


## <a name="resource-fundraiser_invitation">Fundraiser Invitation</a>


An invitation to create a fundraiser for a specific project

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when the invitation was created | `"2012-01-01T12:00:00Z"` |
| **[id](#resource-common)** | *string* | The unique identifier of the fundraiser invitation | `1234567` |
| **[invitation_link](#resource-common)** | *uri* |  | `"https://example.betternow.org/i/invitation-token"` |
| **[invitee:avatar_url](#resource-user)** | *uri* | The URL for the avatar image for the user. 92x92 pixels | `"https://cdn.example.net/avatar.jpg"` |
| **[invitee:first_name](#resource-user)** | *string* | The first name of the user | `"Firstname"` |
| **[invitee:last_name](#resource-user)** | *string* | The last name of the user | `"Lastname"` |
| **[invitee:middle_name](#resource-user)** | *string* | The middle name of the user | `"Middlename"` |
| **[invitee:private_person_url](#resource-user)** | *uri* | The URL to retreive private information about the user. A secret key is required for this URL | `"https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"` |
| **[inviter:avatar_url](#resource-user)** | *uri* | The URL for the avatar image for the user. 92x92 pixels | `"https://cdn.example.net/avatar.jpg"` |
| **[inviter:first_name](#resource-user)** | *string* | The first name of the user | `"Firstname"` |
| **[inviter:last_name](#resource-user)** | *string* | The last name of the user | `"Lastname"` |
| **[inviter:middle_name](#resource-user)** | *string* | The middle name of the user | `"Middlename"` |
| **[inviter:private_person_url](#resource-user)** | *uri* | The URL to retreive private information about the user. A secret key is required for this URL | `"https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"` |
| **[project:html_url](#resource-common)** | *uri* | The current url to view the project page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/projects/helpnow-projekt"` |
| **[project:id](#resource-common)** | *string* | Unique identifier of project | `1234567` |
| **[project:name](#resource-common)** | *string* | The name of the Project | `"HelpNows generelle arbejde"` |
| **[project:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/projects/1234567"` |
| **updated_at** | *date-time* | when invitation was updated | `"2012-01-01T12:00:00Z"` |

### Fundraiser Invitation Create

Create a fundraiser invitation. Requires a secret key.

```
POST /fundraiser-invitations
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **email** | *string* | The email that will be sent the invitation | `"user@example.com"` |
| **first_name** | *string* | The first name of the user | `"Firstname"` |
| **inviter_email** | *string* | Must be an exisiting user in the BetterNow system | `"user@example.com"` |
| **last_name** | *string* | The last name of the user | `"Lastname"` |
| **project_id** | *string* | Unique identifier of project | `1234567` |
| **site_id** | *integer* | unique identifier of site | `1234567` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **middle_name** | *string* | The middle name of the user | `"Middlename"` |


#### Curl Example

```bash
$ curl -n -X POST https://api.betternow.org/fundraiser-invitations \
  -d '{
  "inviter_email": "user@example.com",
  "site_id": 1234567,
  "project_id": 1234567,
  "email": "user@example.com",
  "first_name": "Firstname",
  "middle_name": "Middlename",
  "last_name": "Lastname"
}' \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "created_at": "2012-01-01T12:00:00Z",
  "id": 1234567,
  "inviter": {
    "avatar_url": "https://cdn.example.net/avatar.jpg",
    "first_name": "Firstname",
    "middle_name": "Middlename",
    "last_name": "Lastname",
    "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
  },
  "invitee": {
    "avatar_url": "https://cdn.example.net/avatar.jpg",
    "first_name": "Firstname",
    "middle_name": "Middlename",
    "last_name": "Lastname",
    "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
  },
  "invitation_link": "https://example.betternow.org/i/invitation-token",
  "project": {
    "id": 1234567,
    "name": "HelpNows generelle arbejde",
    "url": "https://api.betternow.org/projects/1234567",
    "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
  },
  "updated_at": "2012-01-01T12:00:00Z"
}
```


## <a name="resource-fundraiser_update">Fundraiser Update</a>


An update that was sent to all donors to this fundraiser and posted on the fundraiser page

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **body** | *string* | The body of the update, can contain HTML | `"<p>Thanks for all your support - you <strong>rock!</strong>"` |
| **[cover_media:image:url](#resource-common)** | *uri* | The url for the image. On the BetterNow site, the video takes precedence if both exist. 461x306 pixels | `"https://cnd.example.net/image.jpg"` |
| **[cover_media:thumb:url](#resource-common)** | *uri* | The url for the cover media that should be displayed in e.g. a card view. 120x80 pixels | `"https://cnd.example.net/image.jpg"` |
| **cover_media:video:oembed_html** | *string* | The OEmbed HTML to display the video. Could be blank. | `"<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"` |
| **[cover_media:video:url](#resource-common)** | *uri* | The url for the video. Currently only YouTube and Vimeo are supported. Could be blank. | `"https://youtu.be/12345"` |
| **created_at** | *date-time* | when update was created | `"2012-01-01T12:00:00Z"` |
| **[owner:avatar_url](#resource-user)** | *uri* | The URL for the avatar image for the user. 92x92 pixels | `"https://cdn.example.net/avatar.jpg"` |
| **[owner:first_name](#resource-user)** | *string* | The first name of the user | `"Firstname"` |
| **[owner:last_name](#resource-user)** | *string* | The last name of the user | `"Lastname"` |
| **[owner:middle_name](#resource-user)** | *string* | The middle name of the user | `"Middlename"` |
| **[owner:private_person_url](#resource-user)** | *uri* | The URL to retreive private information about the user. A secret key is required for this URL | `"https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"` |
| **title** | *string* | The title of the update | `"Great job everyone!"` |
| **updated_at** | *date-time* | when update was updated | `"2012-01-01T12:00:00Z"` |


## <a name="resource-organisation">Organisation</a>


An Organisation can receive Donations on BetterNow

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **[cover_media:image:url](#resource-common)** | *uri* | The url for the image. On the BetterNow site, the video takes precedence if both exist. 461x306 pixels | `"https://cnd.example.net/image.jpg"` |
| **[cover_media:thumb:url](#resource-common)** | *uri* | The url for the cover media that should be displayed in e.g. a card view. 120x80 pixels | `"https://cnd.example.net/image.jpg"` |
| **cover_media:video:oembed_html** | *string* | The OEmbed HTML to display the video. Could be blank. | `"<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"` |
| **[cover_media:video:url](#resource-common)** | *uri* | The url for the video. Currently only YouTube and Vimeo are supported. Could be blank. | `"https://youtu.be/12345"` |
| **[created_at](#resource-common)** | *date-time* | When organisation was created | `"2012-01-01T12:00:00Z"` |
| **[description](#resource-common)** | *string* | The text written by the Organisation's administrators. Contains HTML | `"HelpNow is a dummy organisation created by BetterNow - to help us doing tutorial videos and screenshots. It is not a real organisation, and you cannot donate here.<br><br><br>"` |
| **[donate_url](#resource-common)** | *uri* | The current url to donate directly to the organisation on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://www.betternow.org/dk/fundraisers/helpnow-indsamling1/donations/new"` |
| **donations:count** | *integer* | The count of all donations made to this project | `123` |
| **donations:total_donated:cents** | *integer* | Numeric amount in cents | `1234500` |
| **donations:total_donated:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **[donations:url](#resource-common)** | *uri* | The url to retrieve details on all donations made to this organisation | `"https://api.betternow.org/organisations/1234567/donations"` |
| **fundraisers:count** | *integer* | The number of active fundraisers | `12` |
| **[fundraisers:url](#resource-common)** | *uri* | The url to retrieve all fundraisers | `"https://api.betternow.org/organisations/1234567/fundraisers"` |
| **[html_url](#resource-common)** | *uri* | The current url to view the organisation page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/charities/helpnow"` |
| **[id](#resource-common)** | *string* | Unique identifier of organisation | `1234567` |
| **[logo_url](#resource-common)** | *uri* | The logo for the Organisation. 92x92 pixels. | `"https://cdn.example.net/logo.png"` |
| **[name](#resource-common)** | *string* | The name of the Organisation | `"HelpNow"` |
| **[new_fundraiser_url](#resource-common)** | *uri* | The current url to create a new Fundraiser for this organisation on BetterNow. This can, and does, change. Requests to old urls will redirect to the current url. | `"https://www.betternow.org/dk/projects/helpnow-projekt/fundraisers/new"` |
| **projects:count** | *integer* | The count of the organisation's active projects | `12` |
| **[projects:url](#resource-common)** | *uri* | The url to retrieve details about this organisation's projects | `"https://api.betternow.org/organisations/1234567/projects"` |
| **[updated_at](#resource-common)** | *date-time* | When organisation was updated | `"2012-01-01T12:00:00Z"` |
| **[url](#resource-common)** | *uri* |  | `"https://api.betternow.org/organisations/1234567"` |

### Organisation Info

Info for existing organisation.

```
GET /organisations/{organisation_id_or_slug}
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/organisations/$ORGANISATION_ID_OR_SLUG \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
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
  "html_url": "https://dk.betternow.org/charities/helpnow",
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

```
GET /organisations/{organisation_id_or_slug}/projects
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/organisations/$ORGANISATION_ID_OR_SLUG/projects \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
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
    "html_url": "https://dk.betternow.org/projects/helpnow-projekt",
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
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "slug": "helpnow-project",
    "state": "published",
    "your_reference": "my-crm-project-reference-123456"
  }
]
```

### Organisation List Fundraisers

List all Fundraisers for an existing Organisation. Fundraisers will be ordered by activity score, descending.

```
GET /organisations/{organisation_id_or_slug}/fundraisers
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/organisations/$ORGANISATION_ID_OR_SLUG/fundraisers \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "activity_score": 987654321,
    "allow_organisation_contact": true,
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
    "state": "published",
    "fundraiser_type": "birthday",
    "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/fundraisers/1234567/donations"
    },
    "end_date": "2012-01-01",
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "headline": "Firstname Lastname's Fundraiser for HelpNow",
    "html_url": "https://dk.betternow.org/fundraisers/firstname-lastnames-fundraiser-for-helpnow",
    "id": 1234567,
    "owner": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "middle_name": "Middlename",
      "last_name": "Lastname",
      "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
    },
    "partner_data": null,
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://dk.betternow.org/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
    },
    "slug": "firstname-lastnames-fundraiser-for-helpnow",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/fundraisers/1234567",
    "your_reference": "my-crm-project-reference-123456",
    "honoree": "Dorthe Jensen Hansen",
    "birth_date": "2012-01-01",
    "death_date": "2012-01-01",
    "funeral_date": "2012-01-01"
  }
]
```

### Organisation List Donations

List the donations for an existing Organisation. Donations will always be returned in reverse-chronological order (newest first).

```
GET /organisations/{organisation_id_or_slug}/donations
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/organisations/$ORGANISATION_ID_OR_SLUG/donations \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "amount": {
      "cents": 12345,
      "currency": "EUR"
    },
    "allow_organisation_contact": true,
    "comment": "Wow, what a great idea!",
    "created_at": "2012-01-01T12:00:00Z",
    "id": 1234567,
    "private_details_url": "https://api.betternow.org/donation-details/542e5f3b-7d8e-475c-8d25-5a2c0742672d",
    "name": "Joes Truck Stop",
    "updated_at": "2012-01-01T12:00:00Z",
    "fundraiser": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://dk.betternow.org/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
    },
    "your_reference": "my-crm-project-reference-123456"
  }
]
```


## <a name="resource-person">Person</a>


Private (personally identifiable) information about a BetterNow user (donor, fundraiser owner, team captain, etc.) Requires a secret key.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **allow_site_contact** | *boolean* | true if the user has agreed to be contacted by the site they either donated via or signed up on. | `true` |
| **birth_day** | *integer* | <br/> **Range:** `1 <= value <= 31` | `1` |
| **birth_month** | *integer* | <br/> **Range:** `1 <= value <= 12` | `1` |
| **[created_at](#resource-user)** | *date-time* | when user was created | `"2012-01-01T12:00:00Z"` |
| **donations:count** | *integer* | The count of all donations made by this person | `123` |
| **donations:total_donated:cents** | *integer* | Numeric amount in cents | `1234500` |
| **donations:total_donated:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **[donations:url](#resource-common)** | *uri* | The url to retrieve details on all donations made by this person | `"https://api.betternow.org/people/fdb6cd2a-3ca7-40db-8fae-135daebecdab/donations"` |
| **email** | *string* |  | `"user@example.com"` |
| **[first_name](#resource-user)** | *string* | The first name of the user | `"Firstname"` |
| **fundraisers:count** | *integer* | The number of active fundraisers | `12` |
| **[fundraisers:url](#resource-common)** | *uri* | The url to retrieve all fundraisers | `"https://api.betternow.org/people/fdb6cd2a-3ca7-40db-8fae-135daebecdab/fundraisers"` |
| **id** | *string* | unique identifier of person | `"fdb6cd2a-3ca7-40db-8fae-135daebecdab"` |
| **[last_name](#resource-user)** | *string* | The last name of the user | `"Lastname"` |
| **locale** | *string* | ISO 639-1 locale code | `"en"` |
| **[middle_name](#resource-user)** | *string* | The middle name of the user | `"Middlename"` |
| **partner_reference** | *string* | This is an external identifier that is intended to be used in linking partner systems to BetterNow. The partner reference can be supplied when creating a user. | `"example"` |
| **phone** | *string* | Phone number in E.164 format | `"+4510101010"` |
| **teams:count** | *integer* | The number of teams | `12` |
| **[teams:url](#resource-common)** | *uri* | The url to retrieve all teams | `"https://api.betternow.org/people/fdb6cd2a-3ca7-40db-8fae-135daebecdab/teams"` |
| **title** | *string* |  | `"Director of Personal Fundraising"` |
| **[url](#resource-user)** | *uri* | The URL to retreive private information about the user. A secret key is required for this URL | `"https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"` |

### Person Info

Info for existing person.

```
GET /people/{person_id}
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/people/$PERSON_ID \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "fdb6cd2a-3ca7-40db-8fae-135daebecdab",
  "first_name": "Firstname",
  "middle_name": "Middlename",
  "last_name": "Lastname",
  "email": "user@example.com",
  "phone": "+4510101010",
  "title": "Director of Personal Fundraising",
  "created_at": "2012-01-01T12:00:00Z",
  "birth_month": 1,
  "birth_day": 1,
  "locale": "en",
  "allow_site_contact": true,
  "partner_reference": "example",
  "url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe",
  "donations": {
    "count": 123,
    "total_donated": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "url": "https://api.betternow.org/people/fdb6cd2a-3ca7-40db-8fae-135daebecdab/donations"
  },
  "fundraisers": {
    "count": 12,
    "url": "https://api.betternow.org/people/fdb6cd2a-3ca7-40db-8fae-135daebecdab/fundraisers"
  },
  "teams": {
    "count": 12,
    "url": "https://api.betternow.org/people/fdb6cd2a-3ca7-40db-8fae-135daebecdab/teams"
  }
}
```

### Person List Donations

List this person's donations. Donations will always be returned in reverse-chronological order (newest first).

```
GET /people/{person_id}/donations
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/people/$PERSON_ID/donations \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "amount": {
      "cents": 12345,
      "currency": "EUR"
    },
    "allow_organisation_contact": true,
    "comment": "Wow, what a great idea!",
    "created_at": "2012-01-01T12:00:00Z",
    "id": 1234567,
    "private_details_url": "https://api.betternow.org/donation-details/542e5f3b-7d8e-475c-8d25-5a2c0742672d",
    "name": "Joes Truck Stop",
    "updated_at": "2012-01-01T12:00:00Z",
    "fundraiser": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://dk.betternow.org/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
    },
    "your_reference": "my-crm-project-reference-123456"
  }
]
```

### Person List Fundraisers

List all of this persons Fundraising Pages. Fundraisers will be ordered by activity score, descending.

```
GET /people/{person_id}/fundraisers
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/people/$PERSON_ID/fundraisers \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "activity_score": 987654321,
    "allow_organisation_contact": true,
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
    "state": "published",
    "fundraiser_type": "birthday",
    "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/fundraisers/1234567/donations"
    },
    "end_date": "2012-01-01",
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "headline": "Firstname Lastname's Fundraiser for HelpNow",
    "html_url": "https://dk.betternow.org/fundraisers/firstname-lastnames-fundraiser-for-helpnow",
    "id": 1234567,
    "owner": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "middle_name": "Middlename",
      "last_name": "Lastname",
      "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
    },
    "partner_data": null,
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://dk.betternow.org/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
    },
    "slug": "firstname-lastnames-fundraiser-for-helpnow",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/fundraisers/1234567",
    "your_reference": "my-crm-project-reference-123456",
    "honoree": "Dorthe Jensen Hansen",
    "birth_date": "2012-01-01",
    "death_date": "2012-01-01",
    "funeral_date": "2012-01-01"
  }
]
```

### Person List Teams

List all Teams this person is a member of

```
GET /people/{person_id}/teams
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/people/$PERSON_ID/teams \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "captain": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "middle_name": "Middlename",
      "last_name": "Lastname",
      "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
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
      "captain_name": "Helle Hansen",
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
    "html_url": "https://dk.betternow.org/teams/team-novo",
    "id": 1234567,
    "logo_url": "https://cdn.example.net/logo.png",
    "name": "Team NOVO",
    "partner_data": null,
    "slug": "team-novo",
    "state": "published",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/team/1234567"
  }
]
```


## <a name="resource-project">Project</a>


A Project is a specific cause that Users can Fundraise for. An Organisation typically has several Projects

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **activity_score** | *integer* | A number that can be used for sorting lists of projects. More recently active projects should have a higher activity score than projects who have raised more money long ago. | `987654321` |
| **[cover_media:image:url](#resource-common)** | *uri* | The url for the image. On the BetterNow site, the video takes precedence if both exist. 461x306 pixels | `"https://cnd.example.net/image.jpg"` |
| **[cover_media:thumb:url](#resource-common)** | *uri* | The url for the cover media that should be displayed in e.g. a card view. 120x80 pixels | `"https://cnd.example.net/image.jpg"` |
| **cover_media:video:oembed_html** | *string* | The OEmbed HTML to display the video. Could be blank. | `"<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"` |
| **[cover_media:video:url](#resource-common)** | *uri* | The url for the video. Currently only YouTube and Vimeo are supported. Could be blank. | `"https://youtu.be/12345"` |
| **[created_at](#resource-common)** | *date-time* | When project was created | `"2012-01-01T12:00:00Z"` |
| **[description](#resource-common)** | *string* | The text written by the Project's administrators. Contains HTML | `"We need your money for this <b>GREAT</b> project"` |
| **[donate_url](#resource-common)** | *uri* | The current url to donate directly to the project on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://www.betternow.org/dk/fundraisers/helpnow-indsamling21/donations/new"` |
| **donations:count** | *integer* | The count of all donations made to this project | `123` |
| **donations:total_donated:cents** | *integer* | Numeric amount in cents | `1234500` |
| **donations:total_donated:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **[donations:url](#resource-common)** | *uri* | The url to retrieve details on all donations made to this project | `"https://api.betternow.org/projects/1234567/donations"` |
| **fundraisers:count** | *integer* | The number of active fundraisers | `12` |
| **[fundraisers:url](#resource-common)** | *uri* | The url to retrieve all fundraisers | `"https://api.betternow.org/projects/1234567/fundraisers"` |
| **[html_url](#resource-common)** | *uri* | The current url to view the project page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/projects/helpnow-projekt"` |
| **[id](#resource-common)** | *string* | Unique identifier of project | `1234567` |
| **[name](#resource-common)** | *string* | The name of the Project | `"HelpNows generelle arbejde"` |
| **[new_fundraiser_url](#resource-common)** | *uri* | The current url to create a new Fundraiser for this project on BetterNow. This can, and does, change. Requests to old urls will redirect to the current url. | `"https://www.betternow.org/dk/projects/helpnow-projekt/fundraisers/new"` |
| **[recipient:html_url](#resource-common)** | *uri* | The current url to view the organisation page on BetterNow. This can, and does, change. Requests to old urls will be redirect to the current url. | `"https://dk.betternow.org/charities/helpnow"` |
| **[recipient:id](#resource-common)** | *string* | Unique identifier of organisation | `1234567` |
| **[recipient:name](#resource-common)** | *string* | The name of the Organisation | `"HelpNow"` |
| **[recipient:url](#resource-common)** | *uri* |  | `"https://api.betternow.org/organisations/1234567"` |
| **[slug](#resource-common)** | *string* | The current url path component to identify the project. This can, and does, change.<br/> **pattern:** `^([a-z0-9-]{2,})$` | `"helpnow-project"` |
| **[state](#resource-common)** | *string* | The state of this project | `"published"` |
| **[updated_at](#resource-common)** | *date-time* | When project was updated | `"2012-01-01T12:00:00Z"` |
| **[url](#resource-common)** | *uri* |  | `"https://api.betternow.org/projects/1234567"` |
| **your_reference** | *string* | A string that you can use to identify the project and its fundraisers and donations. The value will be inherited by any fundraisers created for the project and any donations made via the fundraisers. Commonly used to assign donations to e.g. a campaign in your CRM system. You can set this value in the dashboard for your project. | `"my-crm-project-reference-123456"` |

### Project Info

Info for existing project.

```
GET /projects/{project_id_or_slug}
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/projects/$PROJECT_ID_OR_SLUG \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
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
  "html_url": "https://dk.betternow.org/projects/helpnow-projekt",
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
    "html_url": "https://dk.betternow.org/charities/helpnow"
  },
  "slug": "helpnow-project",
  "state": "published",
  "your_reference": "my-crm-project-reference-123456"
}
```

### Project List Fundraisers

List all Fundraisers for an existing Project. Fundraisers will be ordered by activity score, descending.

```
GET /projects/{project_id_or_slug}/fundraisers
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/projects/$PROJECT_ID_OR_SLUG/fundraisers \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "activity_score": 987654321,
    "allow_organisation_contact": true,
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
    "state": "published",
    "fundraiser_type": "birthday",
    "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/fundraisers/1234567/donations"
    },
    "end_date": "2012-01-01",
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "headline": "Firstname Lastname's Fundraiser for HelpNow",
    "html_url": "https://dk.betternow.org/fundraisers/firstname-lastnames-fundraiser-for-helpnow",
    "id": 1234567,
    "owner": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "middle_name": "Middlename",
      "last_name": "Lastname",
      "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
    },
    "partner_data": null,
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://dk.betternow.org/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
    },
    "slug": "firstname-lastnames-fundraiser-for-helpnow",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/fundraisers/1234567",
    "your_reference": "my-crm-project-reference-123456",
    "honoree": "Dorthe Jensen Hansen",
    "birth_date": "2012-01-01",
    "death_date": "2012-01-01",
    "funeral_date": "2012-01-01"
  }
]
```

### Project List Donations

List the donations for existing project. Donations will always be returned in reverse-chronological order (newest first).

```
GET /projects/{project_id_or_slug}/donations
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/projects/$PROJECT_ID_OR_SLUG/donations \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "amount": {
      "cents": 12345,
      "currency": "EUR"
    },
    "allow_organisation_contact": true,
    "comment": "Wow, what a great idea!",
    "created_at": "2012-01-01T12:00:00Z",
    "id": 1234567,
    "private_details_url": "https://api.betternow.org/donation-details/542e5f3b-7d8e-475c-8d25-5a2c0742672d",
    "name": "Joes Truck Stop",
    "updated_at": "2012-01-01T12:00:00Z",
    "fundraiser": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://dk.betternow.org/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
    },
    "your_reference": "my-crm-project-reference-123456"
  }
]
```


## <a name="resource-site">Site</a>


A website running the BetterNow software.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cname** | *string* | The CNAME dns record. | `"fundraising.betternow.org"` |
| **created_at** | *date-time* | when site was created | `"2012-01-01T12:00:00Z"` |
| **hostname** | *string* | The hostname for this site. | `"sample-event.eventsite.org"` |
| **id** | *integer* | unique identifier of site | `1234567` |
| **subdomain** | *string* | The unique subdomain for this site. | `"sample-event"` |
| **updated_at** | *date-time* | when site was updated | `"2012-01-01T12:00:00Z"` |

### Site List

List existing sites

```
GET /sites
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/sites \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "cname": "fundraising.betternow.org",
    "created_at": "2012-01-01T12:00:00Z",
    "id": 1234567,
    "hostname": "sample-event.eventsite.org",
    "subdomain": "sample-event",
    "updated_at": "2012-01-01T12:00:00Z"
  }
]
```


## <a name="resource-team">Team</a>


A Team is a collection of Fundraisers, who may or may not be raising money in connection with a single Event.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **[captain:avatar_url](#resource-user)** | *uri* | The URL for the avatar image for the user. 92x92 pixels | `"https://cdn.example.net/avatar.jpg"` |
| **[captain:first_name](#resource-user)** | *string* | The first name of the user | `"Firstname"` |
| **[captain:last_name](#resource-user)** | *string* | The last name of the user | `"Lastname"` |
| **[captain:middle_name](#resource-user)** | *string* | The middle name of the user | `"Middlename"` |
| **[captain:private_person_url](#resource-user)** | *uri* | The URL to retreive private information about the user. A secret key is required for this URL | `"https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"` |
| **contact_information:captain_name** | *string* | the public captain name for the team | `"Helle Hansen"` |
| **contact_information:email** | *string* | the public contact email for the team | `"myteam@example.com"` |
| **contact_information:phone** | *string* | the public contact phone for the team | `"+4599999999 ex. 1234"` |
| **[cover_media:image:url](#resource-common)** | *uri* | The url for the image. On the BetterNow site, the video takes precedence if both exist. 461x306 pixels | `"https://cnd.example.net/image.jpg"` |
| **[cover_media:thumb:url](#resource-common)** | *uri* | The url for the cover media that should be displayed in e.g. a card view. 120x80 pixels | `"https://cnd.example.net/image.jpg"` |
| **cover_media:video:oembed_html** | *string* | The OEmbed HTML to display the video. Could be blank. | `"<iframe width=\\\"480\\\" height=\\\"270\\\" src=\\\"https://www.youtube.com/embed/G1JBOSwjN6Q?feature=oembed\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>"` |
| **[cover_media:video:url](#resource-common)** | *uri* | The url for the video. Currently only YouTube and Vimeo are supported. Could be blank. | `"https://youtu.be/12345"` |
| **[created_at](#resource-common)** | *date-time* | when team was created | `"2012-01-01T12:00:00Z"` |
| **[description](#resource-common)** | *string* | Text describing the Team added by the Team Captain. Contains HTML. | `"<p>This is really, <b>REALLY</b> great</p> <br><br>"` |
| **donations:count** | *integer* | The count of all donations made | `123` |
| **donations:total_donated:cents** | *integer* | Numeric amount in cents | `1234500` |
| **donations:total_donated:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **[donations:url](#resource-common)** | *uri* | The url to retrieve details on all donations made via team members | `"https://api.betternow.org/teams/1234567/donations"` |
| **fundraisers:count** | *integer* | The number of active fundraisers | `12` |
| **[fundraisers:url](#resource-common)** | *uri* | The url to retrieve all fundraisers | `"https://api.betternow.org/teams/1234567/fundraisers"` |
| **goal:cents** | *integer* | Numeric amount in cents | `1234500` |
| **goal:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **[html_url](#resource-common)** | *uri* | The url to the Team page on BetterNow | `"https://dk.betternow.org/teams/team-novo"` |
| **[id](#resource-common)** | *string* | unique identifier of team | `1234567` |
| **[logo_url](#resource-common)** | *uri* | The logo for the team. 92x92 pixels. | `"https://cdn.example.net/logo.png"` |
| **[name](#resource-common)** | *string* | the name of the Team | `"Team NOVO"` |
| **[partner_data](#resource-common)** | *object* | An object containing data from partner systems. Structure varies depending on the partner. |  |
| **[slug](#resource-common)** | *string* | The current url path component to identify the team. This can, and does, change.<br/> **pattern:** `^([a-z0-9-]{2,})$` | `"team-novo"` |
| **[state](#resource-common)** | *string* | The state of this team | `"published"` |
| **[updated_at](#resource-common)** | *date-time* | when team was updated | `"2012-01-01T12:00:00Z"` |
| **[url](#resource-common)** | *uri* |  | `"https://api.betternow.org/team/1234567"` |

### Team Info

Info for existing team.

```
GET /teams/{team_id_or_slug}
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/teams/$TEAM_ID_OR_SLUG \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "captain": {
    "avatar_url": "https://cdn.example.net/avatar.jpg",
    "first_name": "Firstname",
    "middle_name": "Middlename",
    "last_name": "Lastname",
    "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
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
    "captain_name": "Helle Hansen",
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
  "html_url": "https://dk.betternow.org/teams/team-novo",
  "id": 1234567,
  "logo_url": "https://cdn.example.net/logo.png",
  "name": "Team NOVO",
  "partner_data": null,
  "slug": "team-novo",
  "state": "published",
  "updated_at": "2012-01-01T12:00:00Z",
  "url": "https://api.betternow.org/team/1234567"
}
```

### Team List

List existing teams.

```
GET /teams
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/teams \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "captain": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "middle_name": "Middlename",
      "last_name": "Lastname",
      "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
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
      "captain_name": "Helle Hansen",
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
    "html_url": "https://dk.betternow.org/teams/team-novo",
    "id": 1234567,
    "logo_url": "https://cdn.example.net/logo.png",
    "name": "Team NOVO",
    "partner_data": null,
    "slug": "team-novo",
    "state": "published",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/team/1234567"
  }
]
```

### Team Create

Create a team.

```
POST /teams
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **description** | *string* | Text describing the Team added by the Team Captain. Contains HTML. | `"<p>This is really, <b>REALLY</b> great</p> <br><br>"` |
| **email** | *string* |  | `"user@example.com"` |
| **event_id** | *string* | unique identifier of event | `1234567` |
| **goal:cents** | *integer* | Numeric amount in cents | `1234500` |
| **goal:currency** | *string* | 3 character currency code, as specified in ISO 4217<br/> **pattern:** `^([A-Z]{3})$` | `"EUR"` |
| **name** | *string* | the name of the Team | `"Team NOVO"` |
| **site_id** | *integer* | unique identifier of site | `1234567` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **first_name** | *string* | The first name of the user | `"Firstname"` |
| **last_name** | *string* | The last name of the user | `"Lastname"` |
| **middle_name** | *string* | The middle name of the user | `"Middlename"` |
| **public_captain_name** | *string* | the public captain name for the team | `"Helle Hansen"` |
| **public_phone_number** | *string* | the public contact phone for the team | `"+4599999999 ex. 1234"` |
| **public_team_email** | *string* | the public contact email for the team | `"myteam@example.com"` |


#### Curl Example

```bash
$ curl -n -X POST https://api.betternow.org/teams \
  -d '{
  "name": "Team NOVO",
  "description": "<p>This is really, <b>REALLY</b> great</p> <br><br>",
  "goal": {
    "cents": 1234500,
    "currency": "EUR"
  },
  "email": "user@example.com",
  "first_name": "Firstname",
  "middle_name": "Middlename",
  "last_name": "Lastname",
  "event_id": 1234567,
  "site_id": 1234567,
  "public_captain_name": "Helle Hansen",
  "public_phone_number": "+4599999999 ex. 1234",
  "public_team_email": "myteam@example.com"
}' \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "captain": {
    "avatar_url": "https://cdn.example.net/avatar.jpg",
    "first_name": "Firstname",
    "middle_name": "Middlename",
    "last_name": "Lastname",
    "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
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
    "captain_name": "Helle Hansen",
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
  "html_url": "https://dk.betternow.org/teams/team-novo",
  "id": 1234567,
  "logo_url": "https://cdn.example.net/logo.png",
  "name": "Team NOVO",
  "partner_data": null,
  "slug": "team-novo",
  "state": "published",
  "updated_at": "2012-01-01T12:00:00Z",
  "url": "https://api.betternow.org/team/1234567"
}
```

### Team List Fundraisers

List all Fundraisers that are members of this Team. Fundraisers will be ordered by the amount of money donated, descending

```
GET /teams/{team_id_or_slug}/fundraisers
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/teams/$TEAM_ID_OR_SLUG/fundraisers \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "activity_score": 987654321,
    "allow_organisation_contact": true,
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
    "state": "published",
    "fundraiser_type": "birthday",
    "donate_url": "https://www.betternow.org/dk/fundraisers/firstname-lastnames-fundraiser/donations/new",
    "donations": {
      "count": 123,
      "total_donated": {
        "cents": 1234500,
        "currency": "EUR"
      },
      "url": "https://api.betternow.org/fundraisers/1234567/donations"
    },
    "end_date": "2012-01-01",
    "goal": {
      "cents": 1234500,
      "currency": "EUR"
    },
    "headline": "Firstname Lastname's Fundraiser for HelpNow",
    "html_url": "https://dk.betternow.org/fundraisers/firstname-lastnames-fundraiser-for-helpnow",
    "id": 1234567,
    "owner": {
      "avatar_url": "https://cdn.example.net/avatar.jpg",
      "first_name": "Firstname",
      "middle_name": "Middlename",
      "last_name": "Lastname",
      "private_person_url": "https://api.betternow.org/people/3e9344ff-69be-4ab5-a254-07b067325ebe"
    },
    "partner_data": null,
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://dk.betternow.org/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
    },
    "slug": "firstname-lastnames-fundraiser-for-helpnow",
    "updated_at": "2012-01-01T12:00:00Z",
    "url": "https://api.betternow.org/fundraisers/1234567",
    "your_reference": "my-crm-project-reference-123456",
    "honoree": "Dorthe Jensen Hansen",
    "birth_date": "2012-01-01",
    "death_date": "2012-01-01",
    "funeral_date": "2012-01-01"
  }
]
```

### Team List Donations

List all donations given via this Team

```
GET /teams/{team_id_or_slug}/donations
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/teams/$TEAM_ID_OR_SLUG/donations \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "amount": {
      "cents": 12345,
      "currency": "EUR"
    },
    "allow_organisation_contact": true,
    "comment": "Wow, what a great idea!",
    "created_at": "2012-01-01T12:00:00Z",
    "id": 1234567,
    "private_details_url": "https://api.betternow.org/donation-details/542e5f3b-7d8e-475c-8d25-5a2c0742672d",
    "name": "Joes Truck Stop",
    "updated_at": "2012-01-01T12:00:00Z",
    "fundraiser": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "recipient": {
      "id": 1234567,
      "name": "HelpNow",
      "url": "https://api.betternow.org/organisations/1234567",
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "team": {
      "id": 1234567,
      "name": "Team NOVO",
      "url": "https://api.betternow.org/team/1234567",
      "html_url": "https://dk.betternow.org/teams/team-novo"
    },
    "project": {
      "id": 1234567,
      "name": "HelpNows generelle arbejde",
      "url": "https://api.betternow.org/projects/1234567",
      "html_url": "https://dk.betternow.org/projects/helpnow-projekt"
    },
    "event": {
      "id": 1234567,
      "name": "Copenhagen Marathon 2013",
      "url": "https://api.betternow.org/events/1234567",
      "html_url": "https://dk.betternow.org/events/copenhagen-marathon-2013"
    },
    "your_reference": "my-crm-project-reference-123456"
  }
]
```

### Team List Projects

List all Projects that team members are fundraising for

```
GET /teams/{team_id_or_slug}/projects
```


#### Curl Example

```bash
$ curl -n https://api.betternow.org/teams/$TEAM_ID_OR_SLUG/projects \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
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
    "html_url": "https://dk.betternow.org/projects/helpnow-projekt",
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
      "html_url": "https://dk.betternow.org/charities/helpnow"
    },
    "slug": "helpnow-project",
    "state": "published",
    "your_reference": "my-crm-project-reference-123456"
  }
]
```


## <a name="resource-team_membership">Team Membership</a>


Add or remove a fundraiser for a team

### Team Membership Create

Add a fundraiser to a team

```
POST /team-memberships
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **fundraiser_id** | *string* | The unique identifier of the fundraising page | `1234567` |
| **team_id** | *string* | unique identifier of team | `1234567` |



#### Curl Example

```bash
$ curl -n -X POST https://api.betternow.org/team-memberships \
  -d '{
  "team_id": 1234567,
  "fundraiser_id": 1234567
}' \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### Team Membership Destroy

Delete the association with a team for a fundraiser

```
DELETE /team-memberships/fundraiser_id
```


#### Curl Example

```bash
$ curl -n -X DELETE https://api.betternow.org/team-memberships/fundraiser_id \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.betternow+json; version=1"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```


## <a name="resource-user">User</a>


A BetterNow user

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **avatar_url** | *uri* | The URL for the avatar image for the user. 92x92 pixels | `"https://cdn.example.net/avatar.jpg"` |
| **created_at** | *date-time* | when user was created | `"2012-01-01T12:00:00Z"` |
| **first_name** | *string* | The first name of the user | `"Firstname"` |
| **id** | *integer* | unique identifier of user | `1234567` |
| **last_name** | *string* | The last name of the user | `"Lastname"` |
| **middle_name** | *string* | The middle name of the user | `"Middlename"` |
| **updated_at** | *date-time* | when user was updated | `"2012-01-01T12:00:00Z"` |


