class Pedido {
  final String id;
  final String propietario;
  final String tipoProducto;
  final int cantidad;
  final String imagenUrl;
  final String status;
  final String destino;
  final String horaEstimada;
  final List<Checkpoint> checkpoints;

  Pedido({
    required this.id,
    required this.propietario,
    required this.tipoProducto,
    required this.cantidad,
    required this.imagenUrl,
    required this.status,
    required this.destino,
    required this.horaEstimada,
    required this.checkpoints,
  });
}

class Checkpoint {
  final String nombre;
  final String status;
  final String hora;
  final String destino;

  Checkpoint({
    required this.nombre,
    required this.status,
    required this.hora,
    required this.destino,
  });
}

// Lista de pedidos compartida entre las pantallas
List<Pedido> pedidos = [
  Pedido(
    id: "001",
    propietario: "Carlos Pérez",
    tipoProducto: "Vino Tinto",
    cantidad: 50,
    imagenUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoQQV9E0cWAvqQd-M3-75EVliLIbB1kKljsA&s",
    status: "En vuelo",
    destino: "Seattle",
    horaEstimada: "2:00 PM",
    checkpoints: [
      Checkpoint(
          nombre: "Entrega al aeropuerto",
          status: "Completado",
          hora: "10:30 AM",
          destino: "Aeropuerto JFK"),
      Checkpoint(
          nombre: "Despegue",
          status: "Completado",
          hora: "11:00 AM",
          destino: "En vuelo hacia Seattle"),
      Checkpoint(
          nombre: "En vuelo",
          status: "Completado",
          hora: "11:30 AM",
          destino: "En vuelo hacia Seattle"),
      Checkpoint(
          nombre: "Aterrizando",
          status: "N/I",
          hora: "N/I",
          destino: "Aeropuerto SeaTac"),
      Checkpoint(
          nombre: "Entregado al cliente",
          status: "N/I",
          hora: "N/I",
          destino: "Dirección del cliente"),
    ],
  ),
  Pedido(
    id: "002",
    propietario: "Ana Gómez",
    tipoProducto: "Whisky",
    cantidad: 30,
    imagenUrl:
        "https://i0.wp.com/foodandpleasure.com/wp-content/uploads/2023/11/tequilas-mas-caros-del-mundo-tequila-ley.jpg?resize=600%2C383&ssl=1",
    status: "Aterrizando",
    destino: "Los Ángeles",
    horaEstimada: "3:30 PM",
    checkpoints: [
      Checkpoint(
          nombre: "Entrega al aeropuerto",
          status: "Completado",
          hora: "09:00 AM",
          destino: "Aeropuerto CDMX"),
      Checkpoint(
          nombre: "Despegue",
          status: "Completado",
          hora: "09:30 AM",
          destino: "En vuelo hacia Los Ángeles"),
      Checkpoint(
          nombre: "En vuelo",
          status: "Completado",
          hora: "10:00 AM",
          destino: "En vuelo hacia Los Ángeles"),
      Checkpoint(
          nombre: "Aterrizando",
          status: "Completado",
          hora: "3:00 PM",
          destino: "Aeropuerto LAX"),
      Checkpoint(
          nombre: "Entregado al cliente",
          status: "N/I",
          hora: "N/I",
          destino: "Dirección del cliente"),
    ],
  ),
];
