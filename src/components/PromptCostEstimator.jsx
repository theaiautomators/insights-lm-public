import { useState } from "react";

export default function PromptCostEstimator() {
  const [prompt, setPrompt] = useState("");
  const [model, setModel] = useState("gpt-3.5");

  const tokens = Math.ceil(prompt.length / 4);

  const prices = {
    "gpt-3.5": 0.0015,
    "gpt-4": 0.03,
  };

  const cost = ((tokens / 1000) * prices[model]).toFixed(4);

  return (
    <div className="estimator">
      <h2>Prompt Cost Estimator</h2>

      <textarea
        placeholder="Paste your prompt here..."
        value={prompt}
        onChange={(e) => setPrompt(e.target.value)}
      />

      <select value={model} onChange={(e) => setModel(e.target.value)}>
        <option value="gpt-3.5">GPT-3.5</option>
        <option value="gpt-4">GPT-4</option>
      </select>

      <div className="result">
        <p><b>Estimated Tokens:</b> {tokens}</p>
        <p><b>Estimated Cost:</b> ${cost}</p>
      </div>
    </div>
  );
}
