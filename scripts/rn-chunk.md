
### 21.04.0

Release date: `2021-04-21`

#### Features

- [FT-DES] [ENH] [Resources Status] Reduce the tab headers in detail panel
- [FT-DES] [FE] Optimize graph height when displayed in Tooltip
- [FT-DES] [FE][BE] Add check status information and notification status
- [FRONT|FT-DES] [Front] [Resources status]Can't edit a custom filter in Resources status
- [FRONT|FT-DES] [FE][Graph] Avoid to call timeline when events are not displayed
- [FRONT|FT-DES] [FE][Graph] Align title and download button
- [FRONT|FT-DES] [FE][Graph] Display Min/Max/Avg in Legend
- [FRONT|FT-DES] [FE] Move Graph Options Gear to Graph Header
- [FRONT|FT-DES] [FE] Parent name in details panel header should be a link to the corresponding Resource
- [FT-DES] [FE] Improve details panel compactness
- [FT-CORE] [about] update about page with current team
- [FT-CONF] [Core][Configuration][Engine] Rollback MON-6577
- [FT-POLLER] [Broker] Removing Correlation module changed categories numbers in BBDO protocol

#### Bug fixes

- [FT-CONF] [Install] Missing PERL thing for discovery
- [BACK|FRONT|FT-DES] [Resources Status] The monitoring server continues to keep old values (removed pollers)
- [FRONT|FT-DES] [VALIDATION@FEEDBACK] Wrong legend name in graph
- [VALIDATION@FEEDBACK] Job mappers of type macro are not updated when upgrading to 21.04
- [FRONT|FT-DES] [VALIDATION@FEEDBACK] BA top counter detail panel is not expanded
- [FT-DES] [FE] Tooltip options are not directly updated in panel graph 
- [FRONT|FT-DES|MODERN-UI-UX] [BAM][FE] Configuration listing don't colored line selected to the panel side
- [FRONT|FT-DES] [Resources status] selected filter values are not translated
- [BACK|FRONT|FT-DES] [FE][BE][Resource Status][Graph] Min|Max|Avg is always 1
- [FT-DES] [BUG TEST] : Critical Status display is very big
- [FT-DES] [VALIDATION@FEEDBACK][Resource Status] Details panel should be set to max 75% of the screen width resized
- [FT-CONF] [core/configuration] Inconsistency between the API documentation and the endpoint configuration/monitoring-servers
- [VALIDATION@FEEDBACK] Resource Status display broken on Safari
- [FT-DES] [Resources Status][Graph] services graph are not easy to read
- [FT-DES] [Resources Status][Graph] metrics selection is removed on listing refresh
- [FT-DES] [FE][Graph] Fix date time picker infinite renders and timezone display
- [FT-DES] [BE] Error when getting the command line for Meta Service detail
- [FT-DES] moment-timezone 0.3.0 does manage anymore timezone
- [FT-CONF] [UPGRADE][PLATFORM] Missing tables are not added during upgrade to 21.04
- [FT-CORE] [Install] Upgrade to 20.10.6 sql issue
- [FT-CONF] [Conf] : Hosts/services templates become simple hosts/services
- [FT-CORE] [CORE/Remote Server] Can not delete remote server from UI
- [FRONT|FT-DES|beginner-friendly] [WEB] : Adapt graph scale for b/s unit
- [FT-CORE] [Platform Topology] Script: target address not parsed correctly.
- [FT-CONF] [Conf/Services] Wrong number of services/pages to display
- [FRONT|FT-DES] [FE] Performance graph is not refreshed when the Resource autorefresh is triggered
- [FT-CORE] [Platform Topology] Script: Unable to register a remote on a Central
- [FRONT|FT-DES] [FE] Detail panel header broken when severity set
- [FT-DES] [Core/Resources Status][Bug] : Macros in "URL" and "Action URL"
- [FT-CORE] [CORE] update centreon copyright dates
- [FT-CORE] [INSTABLE] During installation, web installer can not be executed fully

#### Security fixes

- [FT-CORE] [APIv2] API realtime rights give API configuration rights
- [FT-CORE] [Global / forms] Predictable anti-CSRF token
- [FT-CORE] [Configuration / Users] SQL injection in additional information
- [FT-CORE] [ACL/Ressource Access] SQLi on acl_res_name
- [FT-CONF] [Configuration / Hosts] Stored XSS in host Alias
