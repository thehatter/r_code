module SitesHelper

  def site_theme_select_options
    Site::THEMES.map { |theme| [t("site.firms.#{theme}"), theme] }
  end

end
