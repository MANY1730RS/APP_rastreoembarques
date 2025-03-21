import 'package:flutter/material.dart';

class Checkpoint {
  final String nombre;
  final String status;
  final String hora; // Hora del checkpoint
  final String destino; // Destino del checkpoint

  Checkpoint({
    required this.nombre,
    required this.status,
    required this.hora, // Hora del checkpoint
    required this.destino, // Destino del checkpoint
  });
}

class HistorialPedido {
  final String id;
  final String propietario;
  final List<Checkpoint> checkpoints;

  HistorialPedido({
    required this.id,
    required this.propietario,
    required this.checkpoints,
  });
}

class PaginaHistorial extends StatefulWidget {
  const PaginaHistorial({Key? key}) : super(key: key);

  @override
  _PaginaHistorialState createState() => _PaginaHistorialState();
}

class _PaginaHistorialState extends State<PaginaHistorial> {
  final TextEditingController _searchController = TextEditingController();
  List<HistorialPedido> historialPedidos = [
    HistorialPedido(
      id: '001',
      propietario: 'Carlos Pérez',
      checkpoints: [
        Checkpoint(
          nombre: 'Entrega al aeropuerto',
          status: 'Completado',
          hora: '10:30 AM',
          destino: 'Aeropuerto JFK',
        ),
        Checkpoint(
          nombre: 'Despegue',
          status: 'Completado',
          hora: '11:00 AM',
          destino: 'En vuelo hacia Seattle',
        ),
        Checkpoint(
          nombre: 'En vuelo',
          status: 'Completado',
          hora: '11:30 AM',
          destino: 'En vuelo hacia Seattle',
        ),
        Checkpoint(
          nombre: 'Aterrizando',
          status: 'N/I',
          hora: 'N/I',
          destino: 'Aeropuerto SeaTac',
        ),
        Checkpoint(
          nombre: 'Entregado al cliente',
          status: 'N/I',
          hora: 'N/I',
          destino: 'Dirección del cliente',
        ),
      ],
    ),
    HistorialPedido(
      id: '002',
      propietario: 'María López',
      checkpoints: [
        Checkpoint(
          nombre: 'Entrega al aeropuerto',
          status: 'Completado',
          hora: '9:45 AM',
          destino: 'Aeropuerto CDMX',
        ),
        Checkpoint(
          nombre: 'Despegue',
          status: 'Completado',
          hora: '10:15 AM',
          destino: 'En vuelo hacia Los Ángeles',
        ),
        Checkpoint(
          nombre: 'En vuelo',
          status: 'Completado',
          hora: '11:10 AM',
          destino: 'En vuelo hacia Los Ángeles',
        ),
        Checkpoint(
          nombre: 'Aterrizando',
          status: 'Completado',
          hora: '12:00 PM',
          destino: 'Aeropuerto LAX',
        ),
        Checkpoint(
          nombre: 'Entregado al cliente',
          status: 'N/I',
          hora: 'N/I',
          destino: 'Dirección del cliente',
        ),
      ],
    ),
    HistorialPedido(
      id: '003',
      propietario: 'Luis Ramírez',
      checkpoints: [
        Checkpoint(
          nombre: 'Entrega al aeropuerto',
          status: 'Completado',
          hora: '8:30 AM',
          destino: 'Aeropuerto CDG',
        ),
        Checkpoint(
          nombre: 'Despegue',
          status: 'Completado',
          hora: '9:00 AM',
          destino: 'En vuelo hacia Chicago',
        ),
        Checkpoint(
          nombre: 'En vuelo',
          status: 'Completado',
          hora: '10:15 AM',
          destino: 'En vuelo hacia Chicago',
        ),
        Checkpoint(
          nombre: 'Aterrizando',
          status: 'N/I',
          hora: 'N/I',
          destino: 'Aeropuerto O’Hare',
        ),
        Checkpoint(
          nombre: 'Entregado al cliente',
          status: 'N/I',
          hora: 'N/I',
          destino: 'Dirección del cliente',
        ),
      ],
    ),
    HistorialPedido(
      id: '004',
      propietario: 'Ana Torres',
      checkpoints: [
        Checkpoint(
          nombre: 'Entrega al aeropuerto',
          status: 'Completado',
          hora: '7:45 AM',
          destino: 'Aeropuerto MAD',
        ),
        Checkpoint(
          nombre: 'Despegue',
          status: 'Completado',
          hora: '8:30 AM',
          destino: 'En vuelo hacia Houston',
        ),
        Checkpoint(
          nombre: 'En vuelo',
          status: 'En tránsito',
          hora: '10:00 AM',
          destino: 'En vuelo hacia Houston',
        ),
        Checkpoint(
          nombre: 'Aterrizando',
          status: 'N/I',
          hora: 'N/I',
          destino: 'Aeropuerto IAH',
        ),
        Checkpoint(
          nombre: 'Entregado al cliente',
          status: 'N/I',
          hora: 'N/I',
          destino: 'Dirección del cliente',
        ),
      ],
    ),
    HistorialPedido(
      id: '005',
      propietario: 'David Gómez',
      checkpoints: [
        Checkpoint(
          nombre: 'Entrega al aeropuerto',
          status: 'Completado',
          hora: '6:30 AM',
          destino: 'Aeropuerto FCO',
        ),
        Checkpoint(
          nombre: 'Despegue',
          status: 'Completado',
          hora: '7:10 AM',
          destino: 'En vuelo hacia San Francisco',
        ),
        Checkpoint(
          nombre: 'En vuelo',
          status: 'Completado',
          hora: '9:45 AM',
          destino: 'En vuelo hacia San Francisco',
        ),
        Checkpoint(
          nombre: 'Aterrizando',
          status: 'Completado',
          hora: '12:00 PM',
          destino: 'Aeropuerto SFO',
        ),
        Checkpoint(
          nombre: 'Entregado al cliente',
          status: 'Completado',
          hora: '2:30 PM',
          destino: 'Dirección del cliente',
        ),
      ],
    ),
  ];

  List<HistorialPedido> filteredPedidos = [];

  @override
  void initState() {
    super.initState();
    filteredPedidos =
        historialPedidos; // Inicialmente muestra todos los pedidos
  }

  void _filterPedidos() {
    setState(() {
      filteredPedidos = historialPedidos
          .where((pedido) =>
              pedido.id.contains(_searchController.text)) // Filtra por ID
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text("Historial de Envíos"),
        backgroundColor: Colors.orange,
      ),*/
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Barra de búsqueda
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar por ID de Pedido',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (text) => _filterPedidos(),
            ),
            const SizedBox(height: 20),
            // Lista de pedidos filtrados
            Expanded(
              child: ListView.builder(
                itemCount: filteredPedidos.length,
                itemBuilder: (context, index) {
                  final pedido = filteredPedidos[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text("ID Pedido: ${pedido.id}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Propietario: ${pedido.propietario}"),
                          const SizedBox(height: 10),
                          // Mostrar los checkpoints con hora y destino
                          for (var checkpoint in pedido.checkpoints)
                            Row(
                              children: [
                                Text(checkpoint.nombre),
                                Spacer(),
                                Text(checkpoint.status),
                                const SizedBox(width: 10),
                                Text(checkpoint.hora), // Mostrar la hora
                                const SizedBox(width: 10),
                                Text(
                                    "Destino: ${checkpoint.destino}"), // Mostrar el destino
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
