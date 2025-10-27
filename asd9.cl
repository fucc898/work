class Node {
  value : Int;
  left  : Node;
  right : Node;

  init(v : Int) : Node {
    {
      value <- v;
      left <- (new Node);  -- 使用虚拟节点而不是null
      right <- (new Node); -- 使用虚拟节点而不是null
      self;
    }
  };

  is_null() : Bool {
    false
  };

  set_left(n : Node) : Node {
    {
      left <- n;
      self;
    }
  };

  set_right(n : Node) : Node {
    {
      right <- n;
      self;
    }
  };

  in_order_print() : Object {
    {
      if not left.is_null() then left.in_order_print() else 0 fi;
      (new IO).out_int(value);
      (new IO).out_string(" ");
      if not right.is_null() then right.in_order_print() else 0 fi;
    }
  };
};

class NullNode inherits Node {
  init(v : Int) : Node {
    {
      value <- v;
      left <- self;
      right <- self;
      self;
    }
  };

  is_null() : Bool {
    true
  };

  set_left(n : Node) : Node { self };
  set_right(n : Node) : Node { self };
  in_order_print() : Object { 0 };
};

class Main {
  main() : Object {
    let root : Node <- (new Node).init(20) in
    let l : Node <- (new Node).init(10) in
    let r : Node <- (new Node).init(30) in
    let null_node : Node <- (new NullNode).init(0) in
    {
      root.set_left(l);
      root.set_right(r);
      l.set_left(null_node);
      l.set_right(null_node);
      r.set_left(null_node);
      r.set_right(null_node);
      root.in_order_print();
    }
  };
};
