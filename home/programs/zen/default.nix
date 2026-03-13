# Zen is a minimalistic web browser.
{inputs, ...}: {
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;

      AutofillAddressesEnabled = false;
      AutoFillCreditCardEnabled = false;
      DisablePocket = true;
      DisableProfileImport = true;
      DisableSetDesktopBackground = true;
      DontCheckDefaultBrowser = true;
      HomepageURL = "https://start.hadi.diy";
      StartPage = "";
      NewTabPage = true;
      OfferToSaveLogins = true;
      # find more options here: https://mozilla.github.io/policy-templates/
    };
  };
}
