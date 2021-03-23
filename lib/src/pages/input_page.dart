import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '', _email = '', _password = '', _birthday = '', _dropDownValue = 'Fly';

  TextEditingController _editingController = new TextEditingController();
  List<String> _powerList = ['Fly', 'X Ray', 'Strong'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropDown(),
          Divider(),
        ],
      ),
    );
  }

  Widget _createInput(){
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letters: ${_name.length}'),
        hintText:  'Name',
        labelText: 'Name',
        helperText: 'Name: $_name',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value){
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letters: ${_email.length}'),
        hintText:  'Email',
        labelText: 'Email',
        helperText: 'Email: $_email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value) => setState(() => _email = value),
    );
  }

  Widget _createPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letters: ${_password.length}'),
        hintText:  'Password',
        labelText: 'Password',
        helperText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (value) => setState(() => _password = value),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _editingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letters: ${_birthday.length}'),
        hintText:  'Birthday',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime pickDate = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'),
    );
    if (pickDate != null){
      setState(() {
        _birthday = pickDate.toString();
        _editingController.text = _birthday;
      });
    }
    print(pickDate);
  }

  List<DropdownMenuItem<String>> getOptionsDD(){
    List<DropdownMenuItem<String>> list = [];
    int i = 1;
    _powerList.forEach((p) {
      list.add(new DropdownMenuItem(
          value: p,
          child: Text(p)
      ));
      i++;
    });
    return list;
  }

  Widget _createDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _dropDownValue,
            items: getOptionsDD(),
            onChanged: (opt) {
              setState(() {
                _dropDownValue = opt;
              });
            },
          ),
        )

      ],
    );
  }
}
