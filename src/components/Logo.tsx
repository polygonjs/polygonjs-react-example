import './Logo.css';

export const Logo = () => {
	return (
		<div className="logo-container">
			<a className="logo" href="https://polygonjs.com/docs/integrations/react">
				<img src="/images/logos.x32.png" alt="Demo of Polygonjs + React"></img>
				<span className="link-label">Polygonjs + React Demo</span>
			</a>
		</div>
	);
};
