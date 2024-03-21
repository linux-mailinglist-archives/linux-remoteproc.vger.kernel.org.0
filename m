Return-Path: <linux-remoteproc+bounces-839-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD24886028
	for <lists+linux-remoteproc@lfdr.de>; Thu, 21 Mar 2024 18:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD5F1282238
	for <lists+linux-remoteproc@lfdr.de>; Thu, 21 Mar 2024 17:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F4913340E;
	Thu, 21 Mar 2024 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k70eqOPX"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E4F133408;
	Thu, 21 Mar 2024 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711043859; cv=none; b=XCJUTlVC4V0DrLCWIv3fAaC+ROVr4IaqvcdC8330/G00cCRtbpc4GYnmWUd0hYSWE/Zx8i2h9NXUmtHRNaEV9tiVEjH60jMUtJ5VUCJy7Z6IdDyVgud54Xq/OO35Zz+1E0SE3adxZeHpygHWaI8bXoy5H8I+wmrTeG1iQ5V+8Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711043859; c=relaxed/simple;
	bh=VSlbdcA1cpZjWKahCfYaYXGeEUF2FdtzF6Z7mb9PwJI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qKMyOOQurjM8e8e/D7fgzkm8f9obUW0fRyN3uqJGd3XfxdAZnB4eV7ojmqPRtNpF8z8M5jjqV7LKHQul7+cUzj/QeklmAIWPk0Puq2Uy5QWHr9DZEqH2BtzWmuzpfdOacPNq/OJje9ES9p0EAfRf8GavWcS/qDl6T7kARL5NFIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k70eqOPX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A84CBC433F1;
	Thu, 21 Mar 2024 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711043858;
	bh=VSlbdcA1cpZjWKahCfYaYXGeEUF2FdtzF6Z7mb9PwJI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=k70eqOPXO0yLFjO86aWLI/E/cv6ghBkJeQimX2htSAFVmuXGx6lJl7/NpRHqVhoKy
	 T3KCIIxYGC0ukSuhrJyjnPqjoNzpnBZmY42QvKSkYcP2Ez0a8H/eo3loUcaJDHW0TC
	 nvDAdg0dIHeGESreCwIjcJ6tR7U/P7jriVyjICoFcSdm3ZsscE16iOpCQwGznH24F3
	 Cfrjl0LjNerg6mG18Ig3HTaVN9dkr9pNLi0R2vx64q8ACWi2UzFJe4dt4238tjIH3b
	 Pg/qU5A+KyT8n8iZfgkfZncfSpY7nOr/z6Api9Ibdpys2qgVw1AxRmYY/StnEoXC2s
	 8q38YFrkBBIbQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9E084D95060;
	Thu, 21 Mar 2024 17:57:38 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v6.9
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240321125518.1675903-1-andersson@kernel.org>
References: <20240321125518.1675903-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240321125518.1675903-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.9
X-PR-Tracked-Commit-Id: 62210f7509e13a2caa7b080722a45229b8f17a0a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e875ee5e897db13104faab93bb1ab2b95da9ab9
Message-Id: <171104385863.25447.2950152220216254695.pr-tracker-bot@kernel.org>
Date: Thu, 21 Mar 2024 17:57:38 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Joakim Zhang <joakim.zhang@cixtech.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 21 Mar 2024 05:55:13 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0e875ee5e897db13104faab93bb1ab2b95da9ab9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

