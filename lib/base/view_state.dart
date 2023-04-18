
enum ViewState {
  idle, // The view is in an idle state and not currently doing anything
  loading, // The view is currently loading data or performing an action
  error, // The view encountered an error and cannot proceed
  success, // The view has successfully loaded data or completed an action
}