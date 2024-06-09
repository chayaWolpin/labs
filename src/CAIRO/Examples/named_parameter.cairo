fn foo(x:u8, y:u8){
x+1;
y+1;
}
fn main(){
    let x=3;
    let y=4;
foo(:x, :y);
}
