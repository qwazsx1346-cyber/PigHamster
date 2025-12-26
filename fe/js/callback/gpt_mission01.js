const orders = [
  { item: "노트북", price: 1200000, quantity: 2 },
  { item: "마우스", price: 35000, quantity: 5 },
  { item: "키보드", price: 89000, quantity: 3 },
  { item: "모니터", price: 450000, quantity: 1 }
];

let totalSales = 0;
let highPriceItems = [];

orders.forEach(order => {
  const sales = order.price * order.quantity;
  totalSales += sales;

  if (sales >= 1000000) {
    highPriceItems.push(order.item);
  }
});

console.log("총 매출:", totalSales);
console.log("고액 상품 목록:", highPriceItems);

