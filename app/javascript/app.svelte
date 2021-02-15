<script>
  import Chart from "svelte-frappe-charts/src/components/base.svelte";

  let servers = [];
  let choose_server = {};

  const fetchServers = () => {
    fetch("/api/v1/servers/index")
      .then((resp) => resp.json())
      .then((json) => (servers = json));
  };
  function choiceServer(name) {
    fetch("/api/v1/server_logs/index?name=" + name)
      .then((resp) => resp.json())
      .then((json) => (choose_server = json));
  }
  function genData(log) {
    return {
      labels: log.data.map((x) => x.date_point),
      datasets: [
        {
          values: log.data.map((x) => {
            if (x.value) {
              return parseFloat(x.value);
            } else {
              return 0.0;
            }
          }),
        },
      ],
    };
  }
  fetchServers();
  setInterval(function () {
    if (choose_server.server.name !== undefined) {
      choiceServer(choose_server.server.name);
    }
  }, 10000);
  let chartRef;
</script>

<style>
  h2 {
    color: blue;
  }
  h3 {
    color: red;
  }
</style>

<ul>
  <h2>servers</h2>
  <h3>
    Choose Server:
    {choose_server.server === undefined ? '' : choose_server.server.name}
  </h3>
  {#each servers as server}
    <li>
      <button on:click={() => choiceServer(server.name)}>
        {server.name}
      </button>
    </li>
  {/each}
</ul>

{#if choose_server.server !== undefined}
  {#each choose_server.logs as log}
    <Chart data={genData(log)} type="line" bind:this={chartRef} />
  {/each}
{/if}
