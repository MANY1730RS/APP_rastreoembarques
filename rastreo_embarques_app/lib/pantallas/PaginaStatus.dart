import 'package:flutter/material.dart';

class EnvioStatus {
  final String id;
  final String propietario;
  final String status;
  final String fechaEstimadaLlegada;
  final String horaEstimadaLlegada;
  final String modoTransporte;
  final String destino;

  EnvioStatus(
      {required this.id,
      required this.propietario,
      required this.status,
      required this.fechaEstimadaLlegada,
      required this.horaEstimadaLlegada,
      required this.modoTransporte,
      required this.destino});
}

class PaginaStatus extends StatelessWidget {
  const PaginaStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de objetos EnvioStatus con algunos datos ficticios
    final List<EnvioStatus> enviosStatus = [
      EnvioStatus(
        id: '001',
        propietario: 'Carlos Pérez',
        status: 'En vuelo',
        fechaEstimadaLlegada: '2025-03-25',
        horaEstimadaLlegada: '14:30',
        modoTransporte: 'Avión',
        destino: 'Seattle, WA',
      ),
      EnvioStatus(
        id: '002',
        propietario: 'María López',
        status: 'Aterrizando',
        fechaEstimadaLlegada: '2025-03-25',
        horaEstimadaLlegada: '15:00',
        modoTransporte: 'Avión',
        destino: 'Los Ángeles, CA',
      ),
      EnvioStatus(
        id: '003',
        propietario: 'Luis Ramírez',
        status: 'Despegue',
        fechaEstimadaLlegada: '2025-03-25',
        horaEstimadaLlegada: '16:15',
        modoTransporte: 'Avión',
        destino: 'Chicago, IL',
      ),
      EnvioStatus(
        id: '004',
        propietario: 'Ana Torres',
        status: 'En aeropuerto',
        fechaEstimadaLlegada: '2025-03-25',
        horaEstimadaLlegada: '17:20',
        modoTransporte: 'Avión',
        destino: 'Houston, TX',
      ),
      EnvioStatus(
        id: '005',
        propietario: 'David Gómez',
        status: 'Entregado',
        fechaEstimadaLlegada: '2025-03-25',
        horaEstimadaLlegada: '18:45',
        modoTransporte: 'Avión',
        destino: 'San Francisco, CA',
      ),
    ];

    return Scaffold(
      /*appBar: AppBar(
        title: const Text("Status de Envíos"),
        backgroundColor: Colors.blue,
      ),*/
      body: ListView.builder(
        itemCount: enviosStatus.length, // Número de registros en la lista
        itemBuilder: (context, index) {
          final envioStatus =
              enviosStatus[index]; // Obtiene el envío de la lista

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text("ID Pedido: ${envioStatus.id}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Propietario: ${envioStatus.propietario}"),
                  Text("Estado: ${envioStatus.status}"),
                  Text("Fecha Estimada: ${envioStatus.fechaEstimadaLlegada}"),
                  Text("Hora Estimada: ${envioStatus.horaEstimadaLlegada}"),
                  Text("Modo de Transporte: ${envioStatus.modoTransporte}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
