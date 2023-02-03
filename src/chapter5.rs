struct Circle {
    r: f32,
}
struct Rect {
    w: f32,
    h: f32,
}

struct Square {
    s: f32,
}

enum ShapeType {
    Rect,
    Circle,
    Square,
}
struct Shape {
    shape: ShapeType,
    circle: Circle,
    rect: Rect,
    square: Square,
}

impl Shape {
    fn area(shape: Shape) -> f32 {
        match shape.shape {
            ShapeType::Rect => {
                let rect = shape.rect;
                rect.w * rect.h
            }
            ShapeType::Circle => {
                let circle = shape.circle;
                std::f32::consts::PI * circle.r * circle.r
            }
            ShapeType::Square => {
                let square = shape.square;
                square.s * square.s
            }
        }
    }
    fn circ(shape: Shape) -> f32 {
        match shape.shape {
            ShapeType::Rect => {
                let rect = shape.rect;
                2.0 * (rect.w + rect.h)
            }
            ShapeType::Circle => {
                let circle = shape.circle;
                2.0 * std::f32::consts::PI * circle.r
            }
            ShapeType::Square => {
                let square = shape.square;
                4.0 * square.s
            }
        }
    }
}
