# README

## Routes

> bundle exec rails routes

```txt
v2_companies GET    /v2/companies(.:format)   api/v2/companies#show
v3_companies GET    /companies(.:format)      api/v3/companies#show
v4_companies GET    /companies(.:format)      api/v4/companies#show
```

## Examples

### API v2

> curl http://127.0.0.1:3000/v2/companies/

```json
{"version":2}
```

### API v3

> curl -H "Accept: application/vnd.example+json;version=3" http://127.0.0.1:3000/companies/

```json
{"version":3}
```

### API v4

> curl -H "Accept: application/vnd.example+json;version=4" http://127.0.0.1:3000/companies/

```json
{"version":4}
```

### Default API

> curl http://127.0.0.1:3000/companies/

```json
{"version":3}
```

ℹ️ The API v3 is the default one, due to this settings:

```ruby
Rails.application.routes.draw do
  scope module: :api do
    # ...

    scope module: :v3, as: 'v3', constraints: ::Route::ApiVersionConstraints.new(version: 3, default: true) do
      get 'companies/', to: 'companies#show'
    end

    # ...
  end
end
```
