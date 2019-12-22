# circular_border_hero

This package provides advanced Hero widget which also animate its child's border.

## Usage

The usage is similiar to ```Hero()```. However, you have to provide radius as ```radius``` parameter is required.

```dart
CircularBorderHero(
  tag: 'tag',
  radius: 10.0,
  child: yourChild,
)
```

If you want to override the default animation, pass a ```flightShuttleBuilder```:

```dart
CircularBorderHero(
  tag: 'tag',
  radius: 10.0,
  child: yourChild,
  flightShuttleBuilder: (context, animation, direction, startContext, endContext) {
    // write your designed animation here
    return; // return a widget
  }
)
```