import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/base_view.dart';
import 'dart:async';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {

  // ===== VARIABLES PRINCIPALES =====
  Timer? _timer;           // Controla el cronómetro
  int _seconds = 0;        // Cuenta los segundos
  bool _isRunning = false; // Estado: corriendo o pausado
  
  // ===== FORMATEAR TIEMPO =====
  String _formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;              // Horas (3600 segundos = 1 hora)
    int minutes = (totalSeconds % 3600) ~/ 60;     // Minutos restantes
    int seconds = totalSeconds % 60;               // Segundos restantes
    
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
  
  // ===== INICIAR CRONÓMETRO =====
  void _startTimer() {
    if (!_isRunning) {
      setState(() {
        _isRunning = true;
      });
      
      // Timer que se ejecuta cada 1 segundo
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++; // Aumentar contador
        });
      });
    }
  }
  
  // ===== PAUSAR CRONÓMETRO =====
  void _pauseTimer() {
    if (_isRunning) {
      setState(() {
        _isRunning = false;
      });
      _timer?.cancel(); // Detener timer
    }
  }
  
  // ===== REINICIAR CRONÓMETRO =====
  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _seconds = 0; // Volver a cero
    });
    _timer?.cancel();
  }
  
  // ===== LIMPIAR RECURSOS =====
  @override
  void dispose() {
    _timer?.cancel(); // ¡Importante! Cancelar timer al salir
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Cronómetro',
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ===== DISPLAY DEL TIEMPO =====
            Container(


              child: Text(

                _formatTime(_seconds),

                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace', // Fuente de ancho fijo
                  color: Colors.black87,
                ),
              ),
            ),

            
            const SizedBox(height: 50),
            
            // ===== BOTONES =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                
                // Botón Iniciar/Pausar (cambia según estado)
                ElevatedButton.icon(
                  onPressed: _isRunning ? _pauseTimer : _startTimer,
                  icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                  label: Text(_isRunning ? 'Pausar' : 'Iniciar'),
                  
                  style: ElevatedButton.styleFrom(

                    backgroundColor: _isRunning ? Colors.orange : Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

                  ),
                ),

                
                // Botón Reiniciar
                ElevatedButton.icon(
                  onPressed: _resetTimer,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reiniciar'),
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

                  ),
                ),

              ],
            ),
            
            const SizedBox(height: 30),

            // ===== INDICADOR DE ESTADO =====
            Text(
              _isRunning ? 'Cronómetro en funcionamiento...' : 'Cronómetro pausado',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
