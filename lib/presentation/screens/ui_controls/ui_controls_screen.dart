import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, train, bus, bike }

class _UiControlsViewState extends State<_UiControlsView> {
  
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool? wantsBreakfast = false;
  bool? wantsLunch = false;
  bool? wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles Adicionales'),
          value: isDeveloper,
          onChanged: (value) {
            isDeveloper = value;
            setState(() {});
          },
        ),
        
        ExpansionTile(
          title: const Text('Transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            
            RadioListTile(
              title: const Text('By Bus'),
              subtitle: const Text('Viajar por barco'),
              value: Transportation.bus,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.bus;
              }),
            ),
            
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar por avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            
            RadioListTile(
              title: const Text('By Train'),
              subtitle: const Text('Viajar por tren'),
              value: Transportation.train,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.train;
              }),
            ),
            
            RadioListTile(
              title: const Text('By Bike'),
              subtitle: const Text('Viajar por bicicleta'),
              value: Transportation.bike,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.bike;
              }),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('Incluir Desayuno?'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast = value;
          }),
        ),

        CheckboxListTile(
          title: const Text('Incluir Comida?'),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch = value;
          }),
        ),

        CheckboxListTile(
          title: const Text('Incluir Cena?'),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            wantsDinner = value;
          }),
        )


      ],
    );
  }
}
