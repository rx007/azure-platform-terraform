project                    = "hmcts"
location                   = "uksouth"
env                        = "ithc"
subscription               = "ithc"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-ithc"

app_gw_private_ip_address = "10.10.36.121"

shutter_storage = "TODO"
cdn_sku         = "TODO"
shutter_rg      = "TODO"

# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
shutter_apps = [
  "TODO"
]

cft_apps_ag_ip_address = "10.10.36.123"
cft_apps_cluster_ips   = ["10.10.33.250", "10.10.35.250"]

frontends = [
  {
    name             = "div-dn"
    custom_domain    = "decree-nisi-aks.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name             = "div-da"
    custom_domain    = "decree-absolute-aks.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name             = "div-rfe"
    custom_domain    = "respond-divorce-aks.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name             = "div-pfe"
    custom_domain    = "petitioner-frontend-aks.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name             = "idam-web-public"
    custom_domain    = "idam-web-public-aks.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    disabled_rules   = {}
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "QueryStringArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "password"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "label"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "oauth2ClientSecret"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "description"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "jwt"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "token"
      },
    ]
  },
  {
    name             = "cmc"
    mode             = "Detection"
    custom_domain    = "moneyclaims.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "cmc-legal"
    mode             = "Detection"
    custom_domain    = "moneyclaims-legal.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "www-ccd"
    mode             = "Detection"
    custom_domain    = "www-ccd.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "gateway-ccd"
    mode             = "Detection"
    custom_domain    = "gateway-ccd.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "return-case-doc-ccd"
    mode             = "Detection"
    custom_domain    = "return-case-doc-ccd.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "xui-approve-org"
    mode             = "Detection"
    custom_domain    = "administer-orgs.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "xui-manage-org"
    mode             = "Detection"
    custom_domain    = "manage-org.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "xui-register-org"
    mode             = "Detection"
    custom_domain    = "register-org.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "xui-webapp"
    mode             = "Detection"
    custom_domain    = "manage-case.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "ia-aip"
    mode             = "Detection"
    custom_domain    = "immigration-appeal.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "probate"
    custom_domain    = "probate.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  }
]