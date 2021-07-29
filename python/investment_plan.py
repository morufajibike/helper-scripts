import click

print("#"*50)
click.secho("Investment per trader and stop loss calculator")
print("#"*50)

click.secho("")
total_cash = click.prompt('Enter investment cash', type=float)
max_percentage_per_trader = click.prompt('Enter maximum percentage per trader', type=float)
max_percentage_stop_loss = click.prompt('Enter maximum percentage stop loss per trader', type=float)

amount_to_invest_per_trader = int(total_cash * (max_percentage_per_trader/100))

total_number_of_investments = int(total_cash / amount_to_invest_per_trader)

max_loss_per_trader = int(amount_to_invest_per_trader * (max_percentage_stop_loss/100))

total_cash_loss = int(total_number_of_investments * max_loss_per_trader)

print("")
print("-"*50)
click.secho(f'Total number of investments/traders: {total_number_of_investments}', fg='yellow')

print("-"*50)
click.secho(f'Amount to invest per trader is: ${amount_to_invest_per_trader}', fg='green')

print("-"*50)
click.secho(f'Maximum stop loss per trader is: ${max_loss_per_trader}', fg='red')

print("-"*50)
click.secho(
    f'Total loss from ${total_cash} and stop loss of ${max_percentage_stop_loss} '
    f'will be is: ${total_cash_loss}', fg='green'
)

total_cash_left = total_cash - total_cash_loss
click.secho(f'What you will have left after your investment is ${total_cash_left}', fg='green')
