use std::io;
use rand::Rng;
use std::cmp::Ordering;
fn main() {
    guess();
}

fn guess(){
    println!("Guess a number!");
    let secret_number = rand::thread_rng().gen_range(1..100);


    'guess: loop{
    let mut guess = String::new();
    println!("Please input your guess:"); //"functions" denoted with exclamation marks are macros
    io::stdin()
    .read_line(&mut guess) 
    .expect("Failed to read line");
    let guess : u32 = match guess.trim().parse() {
        Ok(num) => num,
        Err(_) => continue 'guess,
    };

    match guess.cmp(&secret_number) {
        Ordering::Less => println!("Too small"),
        Ordering::Greater => println!("Too big"),
        Ordering::Equal => { println!("You win"); break;}
    }
    }
}
