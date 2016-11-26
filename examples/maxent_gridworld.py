"""
Run maximum entropy inverse reinforcement learning on the gridworld MDP.

Harshal Priyadarshi.

Code reused and modified from original author:
Matthew Alger, 2015
matthew.alger@anu.edu.au
"""
import sys
import os
sys.path.append(os.path.join(os.path.dirname(sys.path[0]), 'irl'))
sys.path.append(os.path.join(os.path.dirname(sys.path[0]), 'utils'))
import numpy as np
import matplotlib.pyplot as plt
import maxent as maxent
import mdp.gridworld as gridworld
from argument_parser import parse_arguments


def main(grid_size, discount, n_trajectories, epochs, learning_rate, trajectory_length,
         trust, expert_type, random_start):
    """
    Run maximum entropy inverse reinforcement learning on the gridworld MDP.

    Plots the reward function.

    grid_size: Grid size. int.
    discount: MDP discount factor. float.
    n_trajectories: Number of sampled trajectories. int.
    epochs: Gradient descent iterations. int.
    learning_rate: Gradient descent learning rate. float.
    """

    wind = 1 - trust

    gw = gridworld.Gridworld(grid_size, wind, discount, expert_type)
    trajectories = gw.generate_trajectories(n_trajectories,
                                            trajectory_length,
                                            gw.optimal_policy, random_start=random_start)
    feature_matrix = gw.feature_matrix()
    ground_r = np.array([gw.reward(s) for s in range(gw.n_states)])
    r = maxent.irl(feature_matrix, gw.n_actions, discount,
                   gw.transition_probability, trajectories, epochs, learning_rate)

    print r.reshape((grid_size, grid_size))

    plt.subplot(1, 2, 1)
    plt.pcolor(ground_r.reshape((grid_size, grid_size)))
    plt.colorbar()
    plt.title("Groundtruth reward")
    plt.subplot(1, 2, 2)
    plt.pcolor(r.reshape((grid_size, grid_size)))
    plt.colorbar()
    plt.title("Recovered reward")
    plt.show()

if __name__ == '__main__':
    args = parse_arguments()
    main(args.grid_size, args.discount_factor, args.num_trajectories,
         args.epochs, args.learning_rate, args.trajectory_length,
         args.trust, args.expert_type, args.random_start)
