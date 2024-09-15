package main

import (
	"flag"
	"fmt"
	"log"
	base "sabina/base"
)

// Programa principal -----------------
func main() {
	fmt.Println("Sabina Server 0.7")

	// Interpreta els arguments d'execució...
	flRPCPort := flag.Int("rpcPort", 8123, "Port de servei gRPC")
	flDbUser := flag.String("dbuser", "oper", "Usuari de la base de dades")
	flDbPass := flag.String("dbpass", "Oper81Dev23", "Clau de pas de l'usuari de la base de dades")
	flDbAddIP := flag.String("dbAddIP", "127.0.0.1", "Adreça IP del servidor de la base de dades")
	flDbName := flag.String("dbName", "sabina", "Nom de la base de dades")
	flDbPort := flag.Int("dbPort", 33006, "Port d'accés al servidor de la base de dades")
	flag.Parse()

	// Inicialitza l'applicació....
	var err error
	base.App, err = base.NewApp(*flRPCPort, *flDbAddIP, *flDbPort, *flDbName, *flDbUser, *flDbPass)
	if err != nil {
		panic(err)
	}

	// Engeguem els serveis...
	err = base.App.InitServices()
	if err != nil {
		panic(err)
	}

	// Esperem a que l'aplicació finalitzi...
	base.App.Run()
	log.Println("Fins aviat!")
}
