shinyWidgets 0.3.5
==================

Support for bookmarking state.
Support for tooltip from `bsplus`.
Upgrade `pickerInput` to bootstrap-select 1.12.4.
Upgrade `switchInput` to bootstrap-switch 3.3.4.
Remove `receiveSweetAlert` for simpler use with `useSweetAlert`.
Add inline argument to `materialSwitch` ([#17](https://github.com/dreamRs/shinyWidgets/issues/17)).
Display code for dropdowns in gallery.



shinyWidgets 0.3.4
==================

This release fix a bug in the gallery and add tests.


### Bug fixes
* Fix a bug when in `checkboxGroupButtons` when `individual = TRUE`, causing `shinyWidgetsGallery` on launch.



shinyWidgets 0.3.3
==================

Several updates methods implemented.

### New features
* Add function `updateAwesomeCheckbox` for updating single awesome checkbox.
* New function `panel` to create similar panel than in shinydashboard.
* New arguments and examples for `updateSwitchInput`, `updateRadioGroupButtons`, `updateCheckboxGroupButtons`, `updateAwesomeRadio`, `updateAwesomeCheckboxGroup`

### Minor new features and improvements
* Buttons in `searchInput` are now `actionButton`, see #11



shinyWidgets 0.3.2
==================

Better documentation and examples. Alternative function to create a dropdown. New function `colorSelector`.
