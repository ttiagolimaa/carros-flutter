class ApiResponse<T> {
  late bool ok;
  String? msg;
  T? result;

  ApiResponse.ok(this.result) {
    this.ok = true;
  }
  ApiResponse.error(this.msg) {
    this.ok = false;
  }
}
