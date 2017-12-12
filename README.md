# Wanikani

Wrapper for the Wanikani API V2.

## Installation

The package can be installed by adding `wanikani` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:wanikani, "~> 0.1.0"}
  ]
end
```

Documentation canbe found at [https://hexdocs.pm/wanikani](https://hexdocs.pm/wanikani).

## Setup

The library will look for a environment variable called WANIKANI_API_TOKEN for your V2 Wanikani Token. [You can get yours in your account](https://www.wanikani.com/settings/account).

## Example usage

For further examples, [refer to the documentation](https://hexdocs.pm/wanikani).

### Getting the user information

```elixir
iex(1)> Wanikani.User.get
{:ok,
 %{"data" => %{"current_vacation_started_at" => nil, "level" => 39,
     "profile_url" => "https://www.wanikani.com/users/eltercero",
     "started_at" => "2016-03-02T09:14:21.072290Z", "subscribed" => true,
     "username" => "eltercero"},
   "data_updated_at" => "2017-12-12T08:11:06.996305Z", "object" => "user",
   "url" => "https://www.wanikani.com/api/v2/user"}}
```

### Listing a resource (e.g., Kanji list)

```elixir
iex(1)> Wanikani.Kanji.list(%{levels: "1,2"})
{:ok,
 %{"data" => [%{"data" => %{"character" => "一",
        "component_subject_ids" => [1],
        "created_at" => "2012-02-27T19:55:19.000000Z",
        "document_url" => "https://www.wanikani.com/kanji/%E4%B8%80",
        "level" => 1, "meanings" => [%{"meaning" => "One", "primary" => true}],
        "readings" => [%{"primary" => true, "reading" => "いち",
           "type" => "onyomi"},
         %{"primary" => false, "reading" => "ひと", "type" => "kunyomi"},
         %{"primary" => false, "reading" => "かず", "type" => "nanori"}],
        "slug" => "一"}, "data_updated_at" => "2017-10-04T18:56:21.270971Z",
      "id" => 440, "object" => "kanji",
      "url" => "https://www.wanikani.com/api/v2/subjects/440"},...
```

### Getting a single resource (e.g., a radical)

```elixir
iex(1)> Wanikani.Radical.get(41)
{:ok,
 %{"data" => %{"character" => "手", "character_images" => [],
     "created_at" => "2012-02-28T21:14:49.000000Z",
     "document_url" => "https://www.wanikani.com/radicals/hand", "level" => 2,
     "meanings" => [%{"meaning" => "Hand", "primary" => true}],
     "slug" => "hand"}, "data_updated_at" => "2017-06-12T23:21:19.687249Z",
   "id" => 41, "object" => "radical",
   "url" => "https://www.wanikani.com/api/v2/subjects/41"}}
```