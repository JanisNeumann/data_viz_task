# data_viz_task
Automated report using Reactome services.

Should only require the following code to run (in the repository:

  docker build -t data-viz-task .
  docker run data-viz-task

However, one of the main required functions (ReactomePA) currently does not seem to work with Docker, so this will likely terminate with an error.

Due to limitations of the DisGeNet2 implementation, line 40 of the Dockerfile would need to be changed to include working DisGeNet2 credentials (mail & password), which should also be the first thing to change.
