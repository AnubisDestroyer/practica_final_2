import 'package:flutter/material.dart';
import 'package:practica_final_2/ui/input_decorations.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  // Controlador de las validaciones del formulario
  final _keyForm = GlobalKey<FormState>();

  // Campos del formulario
  final _name = TextEditingController();
  final _surname1 = TextEditingController();
  final _surname2 = TextEditingController();
  final _birthdate = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juan'),
      ),
      body: _createForm(context)
    );
  }

  // Creación del formulario
  Form _createForm(BuildContext context) {
    return Form(
      key: _keyForm,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              _createFormTitle(),
              _nameFormField(),
              const SizedBox(height: 15),
              _surnameFormField1(),
              const SizedBox(height: 15),
              _surnameFormField2(),
              const SizedBox(height: 15),
              _birthdateFormField(),
              const SizedBox(height: 15),
              _emailFormField(),
              const SizedBox(height: 15),
              _passwordFormField(),
              const SizedBox(height: 30),
              _createFormButton()
            ],
          ),
        ),
      ),
    );
  }

  // Título del formulario
  Container _createFormTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: const Text('Formulario',
        style: TextStyle(color: Colors.pink, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }

  // Campo Nombre en el formulario
  TextFormField _nameFormField() {
    return TextFormField(
      controller: _name,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecorations.formInputDecoration(
        icon: Icons.account_circle,
        hintText: 'Nombre de la persona',
        labelText: 'Nombre: '),
      validator: (value) {
        if (value!.isEmpty) return 'Debes introducir un nombre';
        if (value.length < 3) return 'El nombre debe tener al menos 3 letras';
        return null;
      },
    );
  }

  // Campo Primer Apellido en el formulario
  TextFormField _surnameFormField1() {
    return TextFormField(
      controller: _surname1,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecorations.formInputDecoration(
        icon: Icons.supervisor_account_rounded,
        hintText: 'Primer Apellido',
        labelText: 'Primer apellido: '),
      validator: (value) {
        if (value!.isEmpty) return 'Debes introducir un apellido';
        if (value.length < 3) return 'El apellido debe tener al menos 3 letras';
        return null;
      },
    );
  }

  // Campo Segundo Apellido en el formulario
  TextFormField _surnameFormField2() {
    return TextFormField(
      controller: _surname2,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecorations.formInputDecoration(
        icon: Icons.supervisor_account_rounded,
        hintText: 'Segundo Apellido',
        labelText: 'Segundo apellido: '),
      validator: (value) {
        if (value!.isEmpty) return 'Debes introducir un apellido';
        if (value.length < 3) return 'El apellido debe tener al menos 3 letras';
        return null;
      },
    );
  }

  // Campo Fecha de nacimiento en el formulario
  TextFormField _birthdateFormField() {
    return TextFormField(
      controller: _birthdate,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.calendar_today_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento: '),
      validator: (value) {
        if (value!.isEmpty) return 'Debes introducir tu fecha de nacimiento';
        return null;
      },
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  // Campo Email en el formulario
  TextFormField _emailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _email,
      decoration: InputDecorations.formInputDecoration(
          hintText: "Email", labelText: "Email: ", icon: Icons.alternate_email),
      validator: (value) {
        String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = RegExp(pattern);
        return regExp.hasMatch(value ?? '') ? null : 'No es un correo válido';
      },
    );
  }

  // Campo Contraseña en el formulario
  TextFormField _passwordFormField() {
    return TextFormField(
      obscureText: true,
      controller: _password,
      decoration: InputDecorations.formInputDecoration(
        hintText: 'Contraseña', labelText: 'Contraseña: ', icon: Icons.lock),
      validator: (value) {
        if (value!.isEmpty) return 'Debes introducir una contraseña';
        if (value.length < 6) return 'La contraseña debe tener al menos 6 caracteres';
        return null;
      },
    );
  }

  // Botón del formulario
  MaterialButton _createFormButton() {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: Colors.grey,
      elevation: 5,
      color: Colors.pink,
      minWidth: 200,
      height: 50,
      child: const Text('Validar Formulario',
        style: TextStyle(color: Colors.white, fontSize: 18)),
      onPressed: () {
        _keyForm.currentState?.validate();
      }
    );
  }

  // Modal de calendario para seleccionar fecha de nacimiento
  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1921),
      lastDate: DateTime.now(),
      locale: const Locale('es', 'ES'));

    if (pickedDate != null) {
      setState(() {
        _birthdate.text = pickedDate.toString();
      });
    }
  }
}
