#!/bin/sh

#### Experiment 1
echo 'Starting experiment 1...'
# Fixed Start
echo 'Fixed Start'
python examples/maxent_gridworld.py --grid-size 5 --discount-factor 0.01 --num-trajectories 100 --epochs 200 --learning-rate 0.01 --trust 0.7 --expert-type uniform --trajectory_length 15 --random-start False
# Random Start
echo 'Random Start'
python examples/maxent_gridworld.py --grid-size 5 --discount-factor 0.01 --num-trajectories 100 --epochs 200 --learning-rate 0.01 --trust 0.7 --expert-type uniform --trajectory_length 15 --random-start True
echo 'Experiment 1 completed.'

#### Experiment 2
echo 'Starting experiment 2...'
# Trust = 0.1
echo 'Trust = 0.1'
python examples/maxent_gridworld.py --grid-size 5 --discount-factor 0.01 --num-trajectories 100 --epochs 200 --learning-rate 0.01 --trust 0.1 --expert-type uniform --trajectory_length 15 --random-start True
# Trust = 0.5
echo 'Trust = 0.5'
python examples/maxent_gridworld.py --grid-size 5 --discount-factor 0.01 --num-trajectories 100 --epochs 200 --learning-rate 0.01 --trust 0.5 --expert-type uniform --trajectory_length 15 --random-start True
# Trust = 0.9
echo 'Trust = 0.9'
python examples/maxent_gridworld.py --grid-size 5 --discount-factor 0.01 --num-trajectories 100 --epochs 200 --learning-rate 0.01 --trust 0.9 --expert-type uniform --trajectory_length 15 --random-start True
echo 'Experiment 2 completed.'

#### Experiment 3
echo 'Starting experiment 3...'
## High Trust (trust = 0.9)
echo 'High trust.'
# Trajectory Length = 5
echo 'Trajectory Length = 5'
python examples/maxent_gridworld.py --grid-size 5 --discount-factor 0.01 --num-trajectories 100 --epochs 200 --learning-rate 0.01 --trust 0.9 --expert-type uniform --trajectory_length 5 --random-start True
# Trajectory Length = 15
echo 'Trajectory Length = 15'
python examples/maxent_gridworld.py --grid-size 5 --discount-factor 0.01 --num-trajectories 100 --epochs 200 --learning-rate 0.01 --trust 0.9 --expert-type uniform --trajectory_length 15 --random-start True
# Trajectory Length = 25
echo 'Trajectory Length = 25'
python examples/maxent_gridworld.py --grid-size 5 --discount-factor 0.01 --num-trajectories 100 --epochs 200 --learning-rate 0.01 --trust 0.9 --expert-type uniform --trajectory_length 25 --random-start True

## Low Trust (trust = 0.1)
echo 'Low trust.'
# Trajectory Length = 15
echo 'Trajectory Length = 15'
python examples/maxent_gridworld.py --grid-size 5 --discount-factor 0.01 --num-trajectories 100 --epochs 200 --learning-rate 0.01 --trust 0.1 --expert-type uniform --trajectory_length 15 --random-start True
# Trajectory Length = 25
echo 'Trajectory Length = 25'
python examples/maxent_gridworld.py --grid-size 5 --discount-factor 0.01 --num-trajectories 100 --epochs 200 --learning-rate 0.01 --trust 0.1 --expert-type uniform --trajectory_length 25 --random-start True
echo 'Experiment 3 completed.'


#### Experiment 4
echo 'Starting experiment 4...'
# Uniform Expert (Trust = 0.5)
echo 'Uniform Expert'
python examples/maxent_gridworld.py --grid-size 5 --discount-factor 0.01 --num-trajectories 2000 --epochs 200 --learning-rate 0.01 --trust 0.5 --expert-type uniform --trajectory_length 15 --random-start True
# Varied Expert (Expected Trust = 0.5)
echo 'Varied Expert'
python examples/maxent_gridworld.py --grid-size 5 --discount-factor 0.01 --num-trajectories 2000 --epochs 200 --learning-rate 0.01 --trust 0.5 --expert-type varied --trajectory_length 15 --random-start True
echo 'Experiment 4 completed.'
echo 'All done'
