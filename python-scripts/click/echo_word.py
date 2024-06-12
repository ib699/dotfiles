import click

@click.command()
def greet():
    name = click.prompt('Enter your name')
    click.echo(f'Hello, {name}!')

if __name__ == '__main__':
    greet()

