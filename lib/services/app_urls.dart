class AppUrls{
  AppUrls._();

  static const String _baseUrl = 'https://scubetech.xyz/projects/dashboard';
  static const String projectElementsUrl = '$_baseUrl/all-project-elements/';
  static const String addProjectElementsUrl = '$_baseUrl/add-project-elements/';
  static  String updateProjectElementsUrl({required int id}) => '$_baseUrl/update-project-elements/$id/';
}