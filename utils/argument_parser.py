"""
Harshal Priyadarshi.
"""

import argparse


def parse_arguments():
    parser = argparse.ArgumentParser(
        description='''Run a Maximum Entropy Inverse Reinforcement Learning Experiment. The parameters can be tweaked
        using the command line arguments.  '''
    )

    parser.add_argument('--grid-size', type=int, help="The size of the grid for each dimension. The grid is square",
                        default=5, dest='grid_size')

    parser.add_argument('--discount-factor', type=float, help="The discount factor for MDP", default=0.01,
                        dest='discount_factor')
    parser.add_argument('--num-trajectories', type=int, help="Number of sampled trajectories from supposed experts",
                        default=50, dest='num_trajectories')
    parser.add_argument('--epochs', type=int, help="Number of epochs to run gradient descent", default=200,
                        dest='epochs')
    parser.add_argument('--learning-rate', type=float, help="Learning rate for Gradient Descent", default=0.01,
                        dest='learning_rate')
    parser.add_argument('--trust', type=float, help="Trust factor of experts. If expert_type is varied then this "
                                                    "value must lie between (0.2 and 0.8)", default=0.7, dest='trust')
    parser.add_argument('--expert-type', type=str, help="Uniform experts or varied experts['uniform', 'varied']",
                        default='uniform', dest='expert_type')
    parser.add_argument('--trajectory_length', type=int, help="Length of each trajectory", default=15,
                        dest='trajectory_length')
    parser.add_argument('--random-start', type=bool, help="True for random start, False for fixed start", default=False,
                        dest='random_start')

    return parser.parse_args()
