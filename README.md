# data_viz_task
Automated report using Reactome services.

Should only require the following code to run (in the repository:

  docker build -t data-viz-task .
  docker run data-viz-task

However, one of the main required functions (ReactomePA) currently does not seem to work with Docker, so this will likely terminate with an error.
