enum EnvironmentType { dev, prod }

final environmentTypes = <EnvironmentType>[
  EnvironmentType.prod,
  EnvironmentType.dev
];

abstract class Environment {
  EnvironmentType get type;

  String get apiKey;

  String get baseUrl;
}
