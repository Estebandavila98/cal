use std::io::{self, BufRead};

fn main() {
    let stdin = io::stdin();
    println!("Introduce números (Ctrl+D para terminar):");

    // Itera sobre cada línea que llegue por stdin
    for line in stdin.lock().lines() {
        match line {
            Ok(raw) => {
                let input = raw.trim();
                if input.is_empty() {
                    continue;
                }

                // Intentamos parsear la línea como i32
                match input.parse::<i32>() {
                    Ok(n) => {
                        let resultado = n + 2;
                        println!("{}", resultado);
                    }
                    Err(_) => {
                        eprintln!("'{}' no es un número válido", input);
                    }
                }
            }
            Err(e) => {
                eprintln!("Error leyendo stdin: {}", e);
                break;
            }
        }
    }
}
