import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';

enum ConnectionType {
  mysql,
  postgresql,
  sqlite,
}

enum ConnectionEnvironment {
  local,
  development,
  staging,
  production,
}

extension ConnectionEnvironmentExtension on ConnectionEnvironment {
  String get getName {
    switch (this) {
      case ConnectionEnvironment.local:
        return 'Local';
      case ConnectionEnvironment.development:
        return 'Development';
      case ConnectionEnvironment.staging:
        return 'Staging';
      case ConnectionEnvironment.production:
        return 'Production';
    }
  }
}

extension ConnectionTypeExtension on ConnectionType {
  String get getName {
    switch (this) {
      case ConnectionType.mysql:
        return 'MySQL';
      case ConnectionType.postgresql:
        return 'PostgreSQL';
      case ConnectionType.sqlite:
        return 'SQLite';
    }
  }
}

class CreateConnectionDialog extends StatefulWidget {
  const CreateConnectionDialog({super.key});

  @override
  State<CreateConnectionDialog> createState() => _CreateConnectionDialogState();
}

class _CreateConnectionDialogState extends State<CreateConnectionDialog> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ConnectionType connectionType = ConnectionType.mysql;
  ConnectionEnvironment _connectionEnvironment = ConnectionEnvironment.local;
  late final TextEditingController _nameController =
      TextEditingController(text: '');
  late final TextEditingController _hostController =
      TextEditingController(text: '');
  late final TextEditingController _usernameController =
      TextEditingController(text: '');
  late final TextEditingController _passwordController =
      TextEditingController(text: '');
  late final TextEditingController _databaseNameController =
      TextEditingController(text: '');
  late final TextEditingController _databasePathController =
      TextEditingController(text: '');
  Color _selectedColor = Colors.green;
  bool _isPasswordVisible = false;
  final _statusColors = [
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Establish new connection',
                style: context.textTheme.titleSmall,
              ),
              HyperLink(
                child: Icon(
                  Icons.close,
                  size: 15,
                  color: context.theme.iconTheme.color,
                ),
                onTap: () => context.router.goBack(),
              ),
            ],
          ),
          const Height15(),
          Row(
            children: [
              Text('Name', style: context.textTheme.bodyMedium),
              const Width10(),
              Expanded(
                child: PrimaryTextFormField(
                  hint: 'DB Client',
                  // height: 1,
                  controller: _nameController,
                  validator: (value) =>
                      value!.isEmpty ? 'Connection name is required' : null,
                ),
              ),
            ],
          ),
          const Height10(),
          Row(
            children: [
              Text('Color', style: context.textTheme.bodyMedium),
              const Width10(),
              Row(
                children: [
                  ..._statusColors.mapIndexed(
                    (index, color) => Row(
                      children: [
                        if (index != 0) const Width10(),
                        HyperLink(
                          onTap: () {
                            _selectedColor = color;
                            setState(() {});
                          },
                          child: Container(
                            width: 40,
                            height: 15,
                            decoration: BoxDecoration(
                              color: color.shade400,
                              border: Border.all(
                                width: color == _selectedColor ? 1.5 : 0,
                                color: color == _selectedColor
                                    ? color.shade800
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Height10(),
          Row(
            children: [
              Text('Type', style: context.textTheme.bodyMedium),
              const Width10(),
              Row(
                children: <Widget>[
                  ...ConnectionType.values.map(
                    (ConnectionType type) => GestureDetector(
                      onTap: () {
                        connectionType = type;
                        setState(() {});
                      },
                      child: Row(
                        children: <Widget>[
                          Radio<ConnectionType>(
                            value: type,
                            groupValue: connectionType,
                            onChanged: (ConnectionType? value) {
                              if (value != null) {
                                connectionType = value;
                                setState(() {});
                              }
                            },
                          ),
                          Text(
                            type.getName,
                            style: context.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Height10(),
          Row(
            children: [
              Text('Environment', style: context.textTheme.bodyMedium),
              const Width10(),
              Row(
                children: <Widget>[
                  ...ConnectionEnvironment.values.map(
                    (ConnectionEnvironment environment) => GestureDetector(
                      onTap: () {
                        _connectionEnvironment = environment;
                        setState(() {});
                      },
                      child: Row(
                        children: <Widget>[
                          Radio<ConnectionEnvironment>(
                            value: environment,
                            groupValue: _connectionEnvironment,
                            onChanged: (ConnectionEnvironment? value) {
                              if (value != null) {
                                _connectionEnvironment = value;
                                setState(() {});
                              }
                            },
                          ),
                          Text(
                            environment.getName,
                            style: context.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (connectionType == ConnectionType.mysql ||
              connectionType == ConnectionType.postgresql) ...[
            const Height10(),
            Row(
              children: [
                Text('Host', style: context.textTheme.bodyMedium),
                const Width10(),
                Expanded(
                  child: PrimaryTextFormField(
                    controller: _hostController,
                    hint: '127.0.0.1',
                    validator: (value) =>
                        value!.isEmpty ? 'Host is required' : null,
                  ),
                ),
                const Width10(),
                Text('Username', style: context.textTheme.bodyMedium),
                const Width10(),
                Expanded(
                  child: PrimaryTextFormField(
                    hint: 'admin',
                    controller: _usernameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Username is required' : null,
                  ),
                ),
              ],
            ),
            const Height10(),
            Row(
              children: [
                Text('Password', style: context.textTheme.bodyMedium),
                const Width10(),
                Expanded(
                  child: PrimaryTextFormField.password(
                    onTap: () {
                      _isPasswordVisible = !_isPasswordVisible;
                      setState(() {});
                      return _isPasswordVisible;
                    },
                    isVisible: _isPasswordVisible,
                    controller: _passwordController,
                    context: context,
                  ),
                ),
              ],
            ),
            const Height10(),
            Row(
              children: [
                Text('Database Name', style: context.textTheme.bodyMedium),
                const Width10(),
                Expanded(
                  child: PrimaryTextFormField(
                    controller: _databaseNameController,
                    hint: 'Cool DB',
                    validator: (value) =>
                        value!.isEmpty ? 'Database name is required' : null,
                  ),
                ),
              ],
            ),
          ],
          if (connectionType == ConnectionType.sqlite) ...[
            const Height10(),
            Row(
              children: [
                Text('Database Path', style: context.textTheme.bodyMedium),
                const Width10(),
                Expanded(
                  child: PrimaryTextFormField(
                    controller: _databasePathController,
                    hint: 'path/to/db',
                    validator: (value) =>
                        value!.isEmpty ? 'Database path is required' : null,
                  ),
                ),
                const Width5(),
                PrimaryButton(
                  width: 70,
                  height: 35,
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  borderColor: context.buttonColor,
                  buttonColor: Colors.transparent,
                  textStyle: context.textTheme.bodySmall!.copyWith(
                    color: context.buttonColor,
                  ),
                  label: 'Select file',
                ),
              ],
            ),
          ],
          const Height20(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PrimaryButton(
                width: 50,
                height: 35,
                onPressed: () {
                  appWindow.maximize();
                  context.router.goToDashboard();
                },
                label: 'Save',
              ),
              const Width10(),
              PrimaryButton(
                width: 50,
                height: 35,
                onPressed: () {
                  appWindow.maximize();
                  context.router.goToDashboard();
                },
                label: 'Test',
              ),
              const Width10(),
              PrimaryButton(
                width: 57,
                height: 35,
                onPressed: () {
                  appWindow.maximize();
                  context.router.goToDashboard();
                },
                label: 'Connect',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
