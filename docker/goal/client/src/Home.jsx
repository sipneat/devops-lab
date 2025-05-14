import React, { useState } from "react";

function Home() {
  const [counter, setCounter] = useState(0);

  function incrementCounter() {
    setCounter(counter + 1);
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen">
      <h1 className="text-5xl">Home</h1>
      <p>Counter = {counter}</p>
      <button
        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
        onClick={incrementCounter}
      >
        Increment
      </button>
      <button
        className="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded ml-2"
        onClick={() => setCounter(counter - 1)}
      >
        Decrement
      </button>
    </div>
  );
}

export default Home;
