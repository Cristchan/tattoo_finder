// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tattoo_finder/login.dart';
import 'cadastrocnpj.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 250,
                color: Colors.black,
                child: Center(
                  child: Image.asset("assets/img/Finder.png"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: const Text(
                          'Crie sua conta',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 212, 212, 208),
                          labelText: 'Nome',
                          hintStyle: TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 212, 212, 208),
                          labelText: 'Email',
                          hintStyle: TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 212, 212, 208),
                          labelText: 'Senha',
                          hintStyle: TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 212, 212, 208),
                          hintStyle: TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          labelText: 'Data de Nascimento',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyHomePage(title: 'Minha Página Principal'),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.black), // Cor de fundo
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Valor do raio para quinas circulares
                            ),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white), // Cor do texto
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 8),
                          child: const Text(
                            'Cadastre-se',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CadastroPageTattuador(
                                  title: 'CadastroPageTattuador'),
                            ),
                          );
                        },
                        child: Text(
                          'É um tatuador? Cadastre-se aqui.',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
