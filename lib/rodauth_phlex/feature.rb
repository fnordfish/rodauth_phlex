module Rodauth
  Feature.define(:phlex, :RodauthPhlex) do
    auth_value_method :phlex_views_namespace, "RodauthPhlex::Views"
    auth_value_method :phlex_components_namespace, "RodauthPhlex::Components"
    auth_value_method :phlex_emails_namespace, "RodauthPhlex::Emails"

    auth_value_method :phlex_layout_class, ::RodauthPhlex::Undefined
    auth_value_method :phlex_layout_title_key, :title
    auth_methods(
      :phlex_set_page_title,
      :phlex_classify_page
    )

    # render a view
    def view(page, title)
      if (layout = phlex_layout_class) != ::RodauthPhlex::Undefined
        scope.phlex_layout(layout)
      end
      scope.phlex_layout_opts(phlex_set_page_title(title, scope.phlex_layout_opts))
      scope.phlex(phlex_view(page, :view))
    end

    # Render a component.
    # Falls back to rendering a view if the component is not defined
    def render(page)
      scope.phlex_layout(false)

      orig_error = nil
      mode = :render
      phlex_view =
        begin
          self.phlex_view(page, mode)
        rescue NameError => e
          raise orig_error if orig_error

          orig_error = e
          mode = :view
          retry
        end

      warn "The page #{page} is not defined in the #{phlex_components_namespace} namespace. Using #{phlex_view} as fallback. Please create a component for it." if mode == :view
      scope.phlex(phlex_view)
    end

    private def phlex_view(page, mode)
      klass = phlex_classify_page(page, mode)
      klass.new(scope.rodauth)
    end

    def phlex_set_page_title(title, opts)
      key = phlex_layout_title_key

      if opts
        opts[key] = title if key
        opts
      else
        key ? {key => title} : {}
      end
    end

    def phlex_classify_page(page_name, mode)
      klass_name = page_name.split(/(?:_|-)/).map(&:capitalize).join
      mod_name = if page_name.end_with?("-email")
        phlex_emails_namespace
      else
        (mode == :render) ? phlex_components_namespace : phlex_views_namespace
      end
      Object.const_get("#{mod_name}::#{klass_name}")
    end
  end
end
