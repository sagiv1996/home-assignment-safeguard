abstract class BaseProviderInterface {
  bool get isLoading;
  bool get hasError;
  void setIsLoading(bool isLoading);
  void setHasError(bool hasError);
}
