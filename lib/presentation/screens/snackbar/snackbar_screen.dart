import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  //Muestra un snackbar
  void showCustomSnackbar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();
    
    final  snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: (){},),
      duration: const Duration(seconds: 2),
    );
    
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  //Muestra un dialogo personalizado 
  void openDialog(BuildContext context){

    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Mollit exercitation irure do eu cillum proident minim cillum excepteur labore laborum. Ea ad deserunt cupidatat eu pariatur irure fugiat laboris voluptate ipsum ullamco deserunt. Labore qui in elit deserunt aliqua dolore duis. Non excepteur labore ad et velit ut qui non magna aute aute magna quis. Nostrud cupidatat sunt velit fugiat sit non laborum. Irure do eu tempor minim consequat non minim proident commodo minim proident amet Lorem velit.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Cancelar')
          ),

          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Aceptar')
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Informacion acerca de las licencias utilizadas para el desarrollo de esta aplicacion.')
                  ]
                );
              }, 
              child: const Text('Licencias Usadas')
            ),

            FilledButton.tonal(
              onPressed: (){
                openDialog(context);
              }, 
              child: const Text('Mostrar Dialogo')
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed:() => showCustomSnackbar(context), 
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}