{ config, lib, pkgs, modulesPath, ... }: {

  programs.firefox.profiles.xin = {
      isDefault = true;
      settings = {
        "app.update.auto" = false;
        "app.shield.optoutstudies.enabled" = true;
        "reader.parse-on-load.force-enabled" = true;
        "privacy.webrtc.legacyGlobalIndicator" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.startup.homepage" = "https://en.wikipedia.org/wiki/Special:Random";
        "browser.link.open_newwindow" = "3";
        "full-screen-api.ignore-widgets" = true;
        "media.rdd-vpx.enabled" = true;
        "general.smoothScroll" = true;
        "browser.tabs.closeWindowWithLastTab" = false;
        "layers.acceleration.force-enabled" = true;
        "dom.forms.autocomplete.formautofill" = false;
        "browser.formfill.enable" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "browser.formfill.expire_days" = "1";
        "font.name.monospace.x-western" = "Iosevka Nerd Font Mono";
        "font.name.sans-serif.x-western" = "IosevkaTerm Nerd Font Propo";
        "font.name.serif.x-western" = "Iosevka Nerd Font";
        "font.size.monospace.x-western" = "18";
        "font.size.variable.x-western" = "18";
        "extensions.pocket.enabled" = false;
        "browser.urlbar.suggest.pocket" = false;
        "network.trr.confirmation_telemetry_enabled" = false;
        "browser.bookmarks.restore_default_bookmarks" = false;
        "privacy.bounceTrackingProtection.enabled" = true;
        "browser.urlbar.showSearchSuggestionsFirst" = false;
        "browser.urlbar.suggest.searches" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "services.sync.prefs.sync.privacy.clearOnShutdown.cookies" = false;
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "browser.search.suggest.enabled" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "devtools.webconsole.input.editorOnboarding" = false;
        "browser.preferences.moreFromMozilla" = false;
      };
    };
}
