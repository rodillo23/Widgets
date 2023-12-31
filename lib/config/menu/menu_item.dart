
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
   
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon}
  );
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Counter Riverpod', 
    subTitle: 'Counter usando el gestor de estado Riverpod', 
    link: '/counter', 
    icon: Icons.numbers_outlined
  ),

  MenuItem(
    title: 'Botones', 
    subTitle: 'Varios botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'Tarjetas', 
    subTitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card
  ),

  MenuItem(
    title: 'Progress Indicators', 
    subTitle: 'Generales y Controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),

  MenuItem(
    title: 'Snackbars y Dialogos', 
    subTitle: 'Indicadores en Pantalla', 
    link: '/snackbar', 
    icon: Icons.info_outline
  ),

  MenuItem(
    title: 'Animated Container', 
    subTitle: 'Stateful Widget Animado', 
    link: '/animated', 
    icon: Icons.animation
  ),

  MenuItem(
    title: 'UI Controls + Tiles', 
    subTitle: 'Una serie de controles en Flutter', 
    link: '/ui-controls', 
    icon: Icons.car_rental_outlined
  ),

  MenuItem(
    title: 'Introduccion a la Aplicacion', 
    subTitle: 'Pequeño tutorial introductorio de la App', 
    link: '/tutorial', 
    icon: Icons.accessibility_rounded
  ),

  MenuItem(
    title: 'Infinit Scroll y Pull', 
    subTitle: 'Listas infinitas y Pull to Refresh', 
    link: '/infinite', 
    icon: Icons.list_alt_rounded
  ),

  MenuItem(
    title: 'Cambiar Tema', 
    subTitle: 'Cambiar Tema de la aplicacion', 
    link: '/theme-changer', 
    icon: Icons.color_lens_outlined
  )
];