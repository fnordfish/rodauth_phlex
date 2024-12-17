# RodauthPhlex (EXPERIMENTAL)

Re-implementation of Rodauth templates in Phlex.

This allows you to use Rodauth with Phlex Vies and Components instead of the built-in templates which require `tilt`.  
The motivation is to not have to depend on `tilt` and to be able to make customizations to the Rodauth templates easier.

Implements via the [`roda-phlex`](https://github.com/fnordfish/roda-phlex) gem.

**This gem should be considered experimental and is not yet fully tested.**

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add rodauth_phlex
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install rodauth_phlex
```

## Usage

In your Roda app Rodauth configuration, disable `render` and enable the `phlex` plugin:

```ruby
require "rodauth_phlex"

class MyApp < Roda
  # We need to the roda phlex plugin as well.
  plugin :phlex
  
  plugin :rodauth, render: false do
    enable :phlex
  end
end
```

### Configuration

* `phlex_views_namespace` : The namespace to use for views. Default is `"RodauthPhlex::Views"`.
* `phlex_components_namespace` : The namespace to use for components. Default is `"RodauthPhlex::Components"`.
* `phlex_email_namespace` : The namespace to use for email templates. Default is `"RodauthPhlex::Emails"`.
* `phlex_layout_class` : The layout class to use for components. Default is `RodauthPhlex::Undefined`, no additional Layout used.
* `phlex_layout_title_key` : The key to use for the title in the layout. Default is `title`. Set to `false` or `nil` to disable setting the title.
* `phlex_set_page_title(title, opts)` : Custom method to set the page title. Where `title` is the string provided by Rodauth und `opts` is the `phlex_layout_opts` options hash.
* `phlex_classify_page(page_name, mode)` : Custom method to classify the page name. Where `page_name` is the template name provided by Rodauth and `mode` is either `:view` or `:render`.

## Under the hood

The plugin overrides the `render` and `view` method to use Phlex views and components instead of the built-in templates.

### Template to Class mapping

An original `foo-bar.str` template is translated into either `RodauthPhlex::Components::FooBar` or `RodauthPhlex::Views::FooBar` class, depending on the context where the template is used:

* When `view` is called with a template name, the `RodauthPhlex::Views` namespace is used.  
  Optionally, the `phlex_layout` is set to the configured `phlex_layout_class`
* When `render` is called with a template name, the `RodauthPhlex::Components` namespace.  
  If the class is not found, it will look in the `RodauthPhlex::Views` namespace and emit a warning to also provide a `RodauthPhlex::Components` class. This is to allow for views to have additional layout to their components.  
  Regardless of the used class, no layout is used (`phlex_layout(false)`).

The original `baz-qux-email.str` templates are translated into `RodauthPhlex::Emails::BazQuxEmail` class.

### Email templates

Email templates are currently supposed to emit plain text for use with the `mail` gem.  
They subclass `RodauthPhlex::Email`, which provides helper methods to render plain text lines. (Which is currently a big hack.)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/fnordfish/rodauth_phlex>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/fnordfish/rodauth_phlex/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RodauthPhlex project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/fnordfish/rodauth_phlex/blob/main/CODE_OF_CONDUCT.md).
