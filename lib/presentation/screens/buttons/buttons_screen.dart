import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          children: [
            
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            
            ElevatedButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.person), 
              label: const Text('Elevated Icon')
            ),

            FilledButton(onPressed: () {}, child: const Text('Filled')),

            FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.person_2), label: const Text('Filled Icon')),

            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),

            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.person_3), label: const Text('Outlined Icon')),

            TextButton(onPressed: () {}, child: const Text('Text Button')),

            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.date_range), label: const Text('Text Button Icon')),

            IconButton(onPressed: (){}, icon: const Icon(Icons.pages_rounded)),

            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.pages_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.secondary),
                iconColor: const MaterialStatePropertyAll(Colors.white)
              ),
            ),

              const CustomButton()
    
          ],
        ),
      ),
    );
  }
}

//Wrap por defecto comienza a formar los hijos de izq a derecha y cuando no encuentra mas espacio salta a la siguiente fila.
//Nos da el efecto de tocar un boton
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Enviar',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}