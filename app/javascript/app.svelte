<script>
  let servers = [];
  let choose_server;
  let choose_server_logs = [];
  const fetchServers = () => {
    fetch("/api/v1/servers/index")
      .then((resp) => resp.json())
      .then((json) => (servers = json));
  };
  function choiceServer(name) {
    choose_server = name;
    fetch("/api/v1/server_logs/index?name=" + name)
      .then((resp) => resp.json())
      .then((json) => (choose_server_logs = json));
  }
  fetchServers();
  setInterval(function () {
    if (choose_server !== undefined) {
      choiceServer(choose_server);
    }
  }, 10000);
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
  <h3>Choose Server: {choose_server === undefined ? '' : choose_server}</h3>
  {#each servers as server}
    <li>
      <button on:click={() => choiceServer(server.name)}>
        {server.name}
      </button>
    </li>
  {/each}
</ul>

{#if choose_server !== undefined}
  <ul>
    {#each choose_server_logs as log}
      <li>{log.log_name} => {log.value}</li>
    {/each}
  </ul>
{/if}
