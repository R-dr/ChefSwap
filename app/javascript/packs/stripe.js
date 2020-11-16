import '@stripe/stripe-js';

const button = document.getElementById("stripe")
const id = location.pathname.split("/")[2]
button.addEventListener("click", (e) => {
  fetch(`/payments?id=${id}`, {
    method: "POST",
    headers: {
      'Content-Type': 'application/json'
    }
  })
  .then((res) => {
    return res.json()
  })
  .then((data) => {
    console.log(data)
    const stripe = Stripe("pk_test_51Hfg1rHas6Qot51JpFFdnuIOKMlsooGJGwDocgBnsjwxS8A2zjUAMt3nu3cxj91lMgS9tDCSRaKRtPePKZS6TJVO00DspAPwqn");
    stripe.redirectToCheckout({
      sessionId: data.id
    })
  })
  .catch((err) => {
    console.log(err.message)
  })
})