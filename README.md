# Decidim INSPIRE

[![[CI] Lint](https://github.com/Platoniq/decidim-inspire/actions/workflows/lint.yml/badge.svg)](https://github.com/Platoniq/decidim-inspire/actions/workflows/lint.yml)
[![[CI] Test](https://github.com/Platoniq/decidim-inspire/actions/workflows/test.yml/badge.svg)](https://github.com/Platoniq/decidim-inspire/actions/workflows/test.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/1b64ecc017885bdf5076/maintainability)](https://codeclimate.com/github/Platoniq/decidim-inspire/maintainability)

Free Open-Source participatory democracy, citizen participation and open government for cities and organizations

This is the open-source repository for decidim_inspire, based on [Decidim](https://github.com/decidim/decidim).

## Custom census authorization handler

This authorization handler allows users to be directly verified with their birthdates by checking the records in a table.

You need to create records for the model `Decidim::CustomCensusRecord`. For example:

```ruby
[
  { email: "john.doe@example.org", date_of_birth: "1956-03-14" },
  { email: "jane.smith@example.org", date_of_birth: "1998-12-06" }
].each do |record|
  Decidim::CustomCensusRecord.create(email: record[:email], metadata: { date_of_birth: record[:date_of_birth] })
end
```

The verification will succeed if the user is in the census and introduces the same birthdate as the one in the database.

This authorization handler will allow us to work with the [Decidim Kids](https://github.com/AjuntamentdeBarcelona/decidim-module-kids) module.

## Setting up the application

You will need to do some steps before having the app working properly once you have deployed it:

1. Create a System Admin user: `bin/rails decidim_system:create_admin`
2. Visit `<your app url>/system` and login with your system admin credentials
3. Create a new organization. Check the locales you want to use for that organization, and select a default locale.
4. Set the correct default host for the organization, otherwise the app will not work properly. Note that you need to include any subdomain you might be using.
5. Fill the rest of the form and submit it.

You are good to go!
